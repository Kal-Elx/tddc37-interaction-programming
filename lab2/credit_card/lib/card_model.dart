import 'package:flutter/material.dart';

class CardModel extends ChangeNotifier {
  var _cardNumber = '#### #### #### ####';
  var _cardHolder = 'FULL NAME';
  var _cvv = '';
  var _month = 'MM';
  var _year = 'YY';
  var _focusCardNumber = false;
  var _focusCardHolder = false;
  var _focusCvv = false;
  var _focusExpires = false;

  get cardNumber => _cardNumber;
  get cardHolder => _cardHolder;
  get cvv => _cvv;
  get month => _month;
  get year => _year;
  get focusCardNumber => _focusCardNumber;
  get focusCardHolder => _focusCardHolder;
  get focusCvv => _focusCvv;
  get focusExpires => _focusExpires;

  void updateCardNumber(newValue) {
    _cardNumber =
        '#### #### #### ####'.replaceRange(0, newValue.length, newValue);
    notifyListeners();
  }

  void updateCardHolder(String newValue) {
    _cardHolder = newValue.length > 0 ? newValue.toUpperCase() : 'FULL NAME';
    notifyListeners();
  }

  void updateCvv(String newValue) {
    _cvv = newValue;
    notifyListeners();
  }

  void updateMonth(String newValue) {
    _month = newValue;
    notifyListeners();
  }

  void updateYear(String newValue) {
    _year = newValue.padLeft(2).substring(newValue.length - 2).trim();
    notifyListeners();
  }

  void setFocusCardNumber(bool focus) {
    _focusCardNumber = focus;
    notifyListeners();
  }

  void setFocusCardHolder(bool focus) {
    _focusCardHolder = focus;
    notifyListeners();
  }

  void setFocusCvv(bool focus) {
    _focusCvv = focus;
    notifyListeners();
  }

  void setFocusExpires(bool focus) {
    _focusExpires = focus;
    notifyListeners();
  }
}
