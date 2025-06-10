#!/bin/python3
from data_cleaner import TransactionCleaner
from transaction_configs import TransactionConfigs


class TransactionProcessor:
    """ used for processing different types of transactions."""

    def __init__(self):
        """Initialize the processor with a cleaner obj."""

        self.cleaner = TransactionCleaner()
        self.base_input_path = 'Backend/data/data_extraction/sms_category/'
        self.base_output_path = 'Backend/data/data_cleaning/cleaned_data/'

    def _process_transaction(self, config_name, input_filename, output_filename, t_type):
        """ helper method to process a transaction type."""

        config = TransactionConfigs.get_config(config_name)
        input_file = f'{self.base_input_path}{input_filename}'
        output_file = f'{self.base_output_path}{output_filename}'

        self.cleaner.clean_transaction_smses(
            input_file, output_file, t_type, config)

    def process_airtime_payment(self):
        """ parse the needed args for processing airtime trasaction"""

        self._process_transaction(
            'airtime',
            'airtime_payments.xml',
            'airtime_payment.json',
            'Airtime'
        )

    def process_bank_deposits(self):
        """ parse args needed for processing bank deposit transactions """

        self._process_transaction(
            'bank_deposit',
            'bank_deposits.xml',
            'bank_deposits.json',
            'Bank deposit',
        )

    def process_bank_transfers(self):
        """ parse arguments for bank transfer processing """

        self._process_transaction(
            'bank_transfer',
            'bank_transfers.xml',
            'bank_transfers.json',
            'Bank transfer'
        )

    def process_bundle_purchases(self):
        """ parse needed args for processing bundle purchases"""

        self._process_transaction(
            'bundle_purchase',
            'bundle_purchases.xml',
            'bundle_purchases.json',
            'Bundle purchase'
        )

    def process_incoming_money(self):
        """ args for processing incoming money transactions."""
        self._process_transaction(
            'incoming_money',
            'incoming_money.xml',
            'incoming_money.json',
            'Received funds'
        )

    def process_momo_code_payments(self):
        """ args for processing MoMo code payment transactions."""

        self._process_transaction(
            'momo_code_payment',
            'momo_code_payment.xml',
            'momo_code_payments.json',
            'MoMo code payments'
        )

    def power_bill_payment(self):
        """ args for processing MoMo code payment transactions."""

        self._process_transaction(
            'power_bill_payment',
            'power_bill_payment.xml',
            'power_bill_payments.json',
            'Payment to MoMo code'
        )

    def third_party_transactions(self):
        """ args for processing third party transactions """

        self._process_transaction(
            'third_party_transaction',
            'thirdParty_transactions.xml',
            'third_party_transactions.json',
            'Third party transactions'
        )

    def mobile_number_transactions(self):
        """ args for processing third party transactions """

        self._process_transaction(
            'transfer_to_mobile_num',
            'transfers_to_mobileNum.xml',
            'transfer_to_mobile_num.json',
            'mobile number transactions'
        )

