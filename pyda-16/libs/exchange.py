# coding: utf-8
import requests

class Rate:
    def __init__(self, format='value', diff=False):
        self.format = format
        self.diff = diff
    
    def get_exchange_rates(url='https://www.cbr-xml-daily.ru/daily_json.js'):
        return requests.get(url).json()

    def previous_exchange_rates(self):
        if self.previous_exchange_rates_url is None:
            return 'Error'

        return self.get_exchange_rates(self.previous_exchange_rates_url)['Valute']

    def current_exchange_rates(self):
        response = self.get_exchange_rates()
        self.previous_exchange_rates_url = "https:" + response['PreviousURL']
        return response['Valute']
    
    def make_format(self, currency):
        """
        Возвращает информацию о валюте currency в двух вариантах:
        - полная информация о валюте при self.format = 'full':
        Rate('full').make_format('EUR')
        {
            'CharCode': 'EUR',
            'ID': 'R01239',
            'Name': 'Евро',
            'Nominal': 1,
            'NumCode': '978',
            'Previous': 79.6765,
            'Value': 79.4966
        }
        
        Rate('value').make_format('EUR')
        79.4966
        """
        exchange_rates = self.current_exchange_rates()
        
        if currency in exchange_rates:
            if self.format == 'full':
                return exchange_rates[currency]
            
            if self.format == 'value':
                if self.diff:
                    old_exchange_rates = self.previous_exchange_rates()

                    return old_exchange_rates[currency]['Value'] - exchange_rates[currency]['Value']
                else:
                    return exchange_rates[currency]['Value']
        
        return 'Error'
    
    def eur(self):
        """Возвращает курс евро на сегодня в формате self.format"""
        return self.make_format('EUR')
    
    def usd(self):
        """Возвращает курс доллара на сегодня в формате self.format"""
        return self.make_format('USD')

    def AZN(self):
        """Возвращает курс азербайджанского маната на сегодня в формате self.format"""
        return self.make_format('AZN')
