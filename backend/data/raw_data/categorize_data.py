#!/bin/python3
import os
import xml.etree.ElementTree as ET
from xml.dom import minidom


class SMSCategorizer:
    """
      For categorizing XML SMS data into their specific transaction types

      Args:
          input_file(str): path to the raw xml file
          output_dir(str): directory path to save the files ccording to their category
      """

    def __init__(self, input_file, output_dir):
        """ Initialize with input file and output directory"""

        self.input_file = input_file
        self.output_dir = output_dir
        self.root = None
        self.categories = {}  # Dict to mapp category names to condition func

        # Create output directory if it doesn't exist
        os.makedirs(output_dir, exist_ok=True)

    def load_xml_data(self):
            """ loads the input xml file and get its root element """

            try:
                tree = ET.parse(self.input_file)
                self.root = tree.getroot()
            except FileNotFoundError as file_error:
                print(f'Unable to parse xml file: \n {file_error}')
                exit(1)

    def add_sms_category(self, name, condition_func):
        """
        Adds a category for SMS categorization.

        Args:
            name (str): name of the category (used for file naming)
            condition_func (function): returns True if an sms body matches
        """
        self.categories[name] = condition_func

    def _process_category(self, category_name, condition_func):
        """ extracts smses that matches the condition to a new xml file """

        # new file name and root element for each category
        new_file_name = f'{category_name}.xml'
        out_file = os.path.join(self.output_dir, new_file_name)
        new_root_tag = f'{category_name}_smses'
        root_element = ET.Element(new_root_tag)  # create new root elem

        # loop through all sms elems and find matching smses
        for sms in self.root.findall('sms'):
            body = sms.attrib.get('body').lower()

            if condition_func(body):
                sms_elem = ET.SubElement(root_element, 'sms')  # new sub elem

                # copy attributes of all matched sms to the new sms elem
                for sms_key, sms_val in sms.attrib.items():
                    sms_elem.set(sms_key, sms_val)

        xml_str = ET.tostring(root_element, encoding='utf-8')

        # convert to xml string and make it pretty indented/formatted
        xml_dom = minidom.parseString(xml_str)
        pretty_xml = xml_dom.toprettyxml(indent='   ')

        with open(out_file, 'w', encoding='utf-8') as f:
            f.write(pretty_xml)

    def _process_non_matches(self):
        """ extracts the rest messages that doesnt match any category """

        def has_no_category(body):
            for condition in self.categories.values():
                if condition(body):
                    return False
            return True

        self._process_category('non_transaction_sms', has_no_category)

    def process_all_sms(self):
        """ processes all categories. both matching and non matching"""

        for name, condition in self.categories.items():
            self._process_category(name, condition)

        #  call for non matches after categorizing matches first.
        self._process_non_matches()

     # methods & category conditions to get related sms data into category

    def incoming_money(body):
        return 'you have received' in body

    def airtime_payment(body):
        return 'to airtime' in body

    def cash_power_bill_payment(body):
        return 'mtn cash power' in body

    def momo_code_payment(body):
        return 'txid:' in body and '*162*' not in body and 'fee was 0 rwf' in body

    def transfers_to_mobile_num(body):
        return '*165*s*' in body and 'fee was:' in body

    def bank_deposits(body):
        return 'a bank deposit of' in body

    def third_party_transactions(body):
        return 'external transaction' in body and 'data bundle' not in body

    def withdrawal_from_agent(body):
        return 'via agent: agent' in body

    def purchase_for_bundles(body):
        return ('bundle' in body or 'data bundle' in body) and 'failed' not in body and 'failed at' not in body

    def bank_transfers(body):
        return (
                'transferred' in body and 'imbank.bank' in body
        ) or 'to onafriq mauritius' in body

    if __name__ == "__main__":
        input_file = 'Backend/data/raw_data/modified_sms_v2.xml'
        output_dir = 'Backend/data/data_extraction/sms_category'

        # Create a categorizer obj
        categorizer = SMSCategorizer(input_file, output_dir)

        # Load XML file
        categorizer.load_xml_data()

        # Add sms categories
        categorizer.add_sms_category('incoming_money', incoming_money)
        categorizer.add_sms_category('airtime_payments', airtime_payment)
        categorizer.add_sms_category(
            'power_bill_payment', cash_power_bill_payment
        )
        categorizer.add_sms_category(
            'momo_code_payment', momo_code_payment
        )
        categorizer.add_sms_category(
            'transfers_to_mobileNum', transfers_to_mobile_num
        )
        categorizer.add_sms_category('bank_deposits', bank_deposits)
        categorizer.add_sms_category(
            'thirdParty_transactions', third_party_transactions
        )
        categorizer.add_sms_category(
            'withdrawal_from_agents', withdrawal_from_agent
        )
        categorizer.add_sms_category('bundle_purchases', purchase_for_bundles)
        categorizer.add_sms_category('bank_transfers', bank_transfers)

        # Process all
        categorizer.process_all_sms()