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
