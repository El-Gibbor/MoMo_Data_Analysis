#!/bin/python3

class TransactionConfigs:
    """ for a centralized transaction configurations (required attributes) """

    CONFIGS = {
        'third_party_transaction': {
            'desc_regx': r'by (.*?) on your MOMO',
            'amount_regx': r'(?:payment|transaction) of ([0-9,]+)\s*rwf',
            'external_tx_id': r'External Transaction Id:\s*([A-Za-z0-9]+)',
            'receiver_regx': r'[A-Za-z]+\s+[A-Za-z]+\s*\(\d+\)|(?<=by ).*?(?= on your MOMO)',
            'default_desc': 'Payment to third party individual'
        },
        'transfer_to_mobile_num': {
            'amount_regx': r'\*165\*s\*(\d+)\s*rwf',
            'receiver_regx': r'to ([A-Za-z]+\s+[A-Za-z]+) (\(\d+\))',
            'sender_id': r'from (\d+)'
        },
        'withdrawal_from_agents': {
            'customer_regx': r'([A-Za-z\s]+)\s\(\*+\d{3}\)',
            'agent_regx': r'([A-Za-z]+)\s\((\d{12})\)',
            'amount_regx': r'withdrawn (\d+)\s*rwf',
            'agent_regx': r'Agent (\w+) \((\d+)\)',
            'withdrawer': r'You (.+?) \((\*+\d+)\)',
            'default_desc': 'Withdrawal done through momo agent'
        },
        'airtime': {
            'default_desc': 'Payment for airtime',
            't_method': 'Airtime (MoMo)',
            'amount_regx': r'payment of (\d+)\s*rwf',
            'new_bal_regx': r'new balance\s*:\s*(\d+)\s*rwf',
        },
        'bank_deposit': {
            'default_desc': 'Bank deposit to mobile money account',
            't_status': 'Successful',
            't_method': r'[. ](Cash Deposit)::',
            'amount_regx': r'bank deposit of (\d+)\s*rwf',
            'new_bal_regx': r'new balance\s*:\s*(\d+)\s*rwf'
        },
        'bank_transfer': {
            'default_desc': 'Mobile money transfer to bank account',
            't_status': 'Successful',
            't_method': 'person-to-person',
            'amount_regx': r'(?:payment of|transferred) (\d+)\s*rwf',
            'institution_vendor': r'ONAFRIQ MAURITIUS|imbank\.bank',
            'receiver_regx': r'to ([A-Za-z]+\s+[A-Za-z]+)\s*\('
        },
        'bundle_purchase': {
            'external_tx_id': r'External Transaction Id:\s*(\d+)',
            'default_desc': 'Payment for bundles and pack (Data, etc)',
            't_method': 'Bundle (MoMo)',
            'amount_regx': r'(?:payment of|transaction of) (\d+)\s*rwf',
        },
        'incoming_money': {
            'default_desc': 'Payments recieved into MoMo account',
            't_status': 'Successful',
            't_method': 'MoMo transfer (Inbound)',
            'amount_regx': r'have received (\d+)\s*rwf',
            'sender_regx': r'from ([A-Za-z]+\s+[A-Za-z]+)\s*(\(\*+\d+\))'
        },
        'momo_code_payment': {
            'default_desc': 'Payment to MoMo codes',
            't_method': 'MoMo transfer (Outbound)',
            'amount_regx': r'payment of ([0-9,]+)\s*rwf',
            'receiver_regx': r'to ([A-Za-z]+\s+[A-Za-z]+)\s+(\d+)'
        },
        'power_bill_payment': {
            'default_desc': 'Cash payment to MTN Cash Power',
            'receiver_regx': r'[to ](MTN Cash Power) with',
            'amount_regx': r'payment of ([0-9,]+)\s*rwf',
            'token_regx': r'token\s+([0-9\-]+)'
        }
    }

    @classmethod
    def get_config(cls, config_name):
        """ Get configuration for a specific transaction type."""
        return cls.CONFIGS.get(config_name, {})