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