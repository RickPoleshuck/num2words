# num2words

A simple utility to translate numbers to words. The largest number supported is 9999 because translating larger numbers to words is less useful.

## Supported languages
- en_US United States English
- es_MX Mexican Spanish

## Examples

Num2Words.create(language: 'en_US').formatWhole(35);
Num2Words.create(language: 'en_MX').formatMoney(123.45);