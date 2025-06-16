#!/bin/python3

import os
import re
import xml.etree.ElementTree as ET
from datetime import datetime
import json


class TransactionCleaner:
    """
    Handles the processing and cleaning of sms transaction data from xml file
    """

    def __init__(self):
        """ initializes the TransactionCleaner """
        pass

    def clean_transaction_smses(self, in_file, out_file, t_type, t_config):
        """
        Processes all the provided transaction sms messages.

        Args:
            in_file (str): Path to input XML file
            out_file (str): Path to output JSON file
            t_type (str): Type of transaction (like 'airtime', 'withdrawal')
            t_config (dict): Configuration for the specific transaction
        """

        # create/ensure output directory exists
        output_dir = os.path.dirname(out_file)
        os.makedirs(output_dir, exist_ok=True)

        # Get the data (xml file)
        try:
            tree = ET.parse(in_file)
            root = tree.getroot()
        except FileNotFoundError as file_err:
            print(f'xml input file error: \n {file_err}')
            exit(1)
        except ET.ParseError as p_err:
            print(f'XML parsing error:\n {p_err}')
            exit(1)

        # Process the transaction sms
        cleaned_transaction = self._process_sms_messages(
                root.findall('sms'), t_type, t_config
            )

        # write clean data (json) to output file
        with open(out_file, 'w', encoding='utf-8') as f:
            json.dump(cleaned_transaction, f, indent=4)

    def _process_sms_messages(self, sms_elements, t_type, t_config):
        """ Process and returns a cleaned transaction of all sms elems"""
        cleaned_transactions = []

        for sms in sms_elements:
            body = sms.attrib.get('body')
            # print(body)
            date_time_str = sms.attrib.get('readable_date', 'no date')

            # transaction oobject to use and process sms data
            transaction = Transaction(t_type, t_config)

            # extract and process sms data
            transaction.extract_date_time(date_time_str)
            transaction.extract_all_data(body)

            # Add to transactions list
            cleaned_data = transaction.get_cleaned_data()
            if cleaned_data:
                cleaned_transactions.append(cleaned_data)

        return cleaned_transactions


class Transaction:
    """
    Represents a transaction with methods to extract and process sms data
    """

    def __init__(self, t_type, t_config):
        """ Initialize a trasaction with some default values"""

        self.data = {
            'transaction_id': None,
            'amount': None,
            't_status': t_config.get('t_status', 'Completed'),
            'transaction_type': t_type,
            'description': None,
            'date_and_time': None,
            'transaction_fee': None,
            'sender': None,
            'receiver': None,
            'new_balance': None,
            'transaction_method': None,
            'institution_vendor': None
        }

        self.config = t_config

    def extract_date_time(self, date_time_str):
        """ extracts and formates the date and time """

        try:
            date_obj = datetime.strptime(date_time_str, '%d %b %Y %I:%M:%S %p')
            self.data['date_and_time'] = date_obj.strftime('%Y-%m-%d %H:%M:%S')
        except ValueError as date_err:
            print(f"Date parsing error:\n {date_err}")

    def _extract_description(self, body):
        """ extracts transaction desc if theres no default, intuitive desc """

        desc_regx = self.config.get('desc_regx')

        if desc_regx is not None:
            matched_desc = re.search(desc_regx, body)
            if matched_desc:
                self.data['description'] = f'Payment to {matched_desc.group(1)} from MoMo'
            else:
                self.data['description'] = self.config.get('default_desc')
        else:
            self.data['description'] = self.config.get('default_desc')

    def _extract_institution_vendor(self, body):
        """ extracts the institution or vendor name"""

        inst_regx = self.config.get('institution_vendor')
        if inst_regx:
            matched_inst = re.search(inst_regx, body)
            if matched_inst:
                self.data['institution_vendor'] = matched_inst.group()
        else:
            self.data.pop('institution_vendor', None)  # remove it (null)

    def _extract_amount(self, body):
        """ extracts transaction amount"""

        amt_regex = self.config.get('amount_regx')

        if amt_regex:
            matched_amt = re.search(amt_regex, body)
            if matched_amt:
                amount = matched_amt.group(1).replace(',', '')
                self.data['amount'] = int(amount)
        else:
            self.data.pop('amount', None)

    def _extract_sender(self, body):
        """Extract sender information."""

        sender_regex = self.config.get('sender_regx')

        if not sender_regex:
            self.data.pop('sender', None)
            return

        sender_match = re.search(sender_regex, body)
        if not sender_match:
            return

        groups = sender_match.groups()

        if len(groups) >= 2:
            self.data['sender'] = f'{groups[0]} {groups[1]}'
        else:
            self.data.pop('sender', None)

    def _extract_receiver(self, body):
        """ extracts receiver information."""
        receiver_regx = self.config.get('receiver_regx')

        if not receiver_regx:
            self.data.pop('receiver', None)
            return

        receiver_match = re.search(receiver_regx, body)
        if not receiver_match:
            self.data['receiver'] = 'N/A'
            return

        groups = receiver_match.groups()

        if len(groups) >= 2:
            self.data['receiver'] = f"{groups[0]} {groups[1]}"
        elif len(groups) >= 1:
            self.data['receiver'] = groups[0]
        else:
            self.data['receiver'] = receiver_match.group()

    def _extract_transaction_id(self, body):
        """Extract transaction ID."""

        txid_regex = r'(?:tx(?:id)?|transaction\s*id|financial\s*transaction\s*id)[\s:]*(\d+)'
        txid_match = re.search(txid_regex, body)

        if txid_match:
            txid_digit = txid_match.group(1)
            self.data['transaction_id'] = 'TxId: ' + txid_digit
        else:
            self.data.pop('transaction_id', None)

    def _extract_external_tx_id(self, body):
        """Extract external transaction ID."""

        ext_tx_id_regex = self.config.get('external_tx_id')

        if ext_tx_id_regex:
            ext_tx_id_match = re.search(ext_tx_id_regex, body)
            if ext_tx_id_match:
                self.data['external_transaction_id'] = ext_tx_id_match.group(1)
            else:
                self.data['external_transaction_id'] = 'N/A'
        else:
            self.data.pop('external_transaction_id', None)

    def _extract_transaction_method(self, body):
        """ extraction of the transaction method used """

        t_method_regex = self.config.get('t_method')

        if t_method_regex:
            t_method_match = re.search(t_method_regex, body)

            if t_method_match:
                self.data['transaction_method'] = t_method_match.group(1)
        else:
            self.data.pop('transaction_method', None)

    def _extract_token(self, body):
        """ extraxct transaction token """

        token_regex = self.config.get('token_regx')

        if token_regex:
            token_regx_match = re.search(token_regex, body)

            if token_regx_match:
                self.data['power_token'] = token_regx_match.group(1)
        else:
            self.data.pop('power_token', None)

    def _extract_transaction_fee(self, body):
        """Extract transaction fee."""

        t_fee_regex = r"(?:fee was|fee paid):?\s*(\d+)\s*rwf"
        match = re.search(t_fee_regex, body)

        if match:
            fee_amount = match.group(1)
            self.data['transaction_fee'] = int(fee_amount)
        else:
            self.data.pop('transaction_fee', None)

    def _extract_new_balance(self, body):
        """ extract new balance after transaction"""

        new_bal_regx = r'new balance\s*:\s*([0-9,]+)\s*rwf'
        new_bal_match = re.search(new_bal_regx, body)

        if new_bal_match:
            new_bal = new_bal_match.group(1).replace(',', '')
            self.data['new_balance'] = int(new_bal)
        else:
            self.data.pop('new_balance')

    def _extract_momo_unq_id(self, body):
        """" users unique momo id for mobile number outbound transactions"""
        unq_id_regx = self.config.get('sender_id')

        if unq_id_regx:
            momo_uniq_id = re.search(unq_id_regx, body)
            self.data["sender_momo_id"] = f"Unique MoMo Id: {momo_uniq_id.group(1)}"

    def _extract_agent(self, body):
        """ extracts the agent then withdrawal made fromm """
        agent_regx = self.config.get('agent_regx')

        if agent_regx:
            agent = re.search(agent_regx, body)
            self.data['agent'] = agent.group()

    def _extract_withdrawer(self, body):
        """ extracts the withdrawers details (info) """
        withrawer_regx = self.config.get('withdrawer')

        if withrawer_regx:
            wd = re.search(withrawer_regx, body)
            self.data['withdrawer'] = f"{wd.group(1)} {wd.group(2)}"

    # =============== [ return cleaned data ] ================
    def get_cleaned_data(self):
        """ Return cleaned transaction data with None values removed """
        clean_data = {}

        for t_key, t_val in self.data.items():
            if t_val is not None:
                clean_data[t_key] = t_val
        return clean_data

    def extract_all_data(self, body):
        """ extracts all transaction data from SMS body."""
        self._extract_institution_vendor(body)
        self._extract_sender(body)
        self._extract_receiver(body)
        self._extract_amount(body.lower())
        self._extract_new_balance(body.lower())
        self._extract_transaction_id(body.lower())
        self._extract_external_tx_id(body)
        self._extract_transaction_fee(body.lower())
        self._extract_transaction_method(body)
        self._extract_token(body.lower())
        self._extract_description(body)
        self._extract_momo_unq_id(body)
        self._extract_agent(body)
        self._extract_withdrawer(body)
