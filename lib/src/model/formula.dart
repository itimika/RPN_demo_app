import 'package:flutter/material.dart';

class FormulaModel with ChangeNotifier {
  String _formula = '';
  List<String> _rpnStack = [];
  static final _limit = 60;

  Text _formulaText;

  get formula => _formula;
  get rpnStack => _rpnStack;
  get formulaText => _formulaText;

  void inputChar(String char) {
    if (char == 'C') {
      _formula = '';
      notifyListeners();
    } else if (char == 'back') {
      _formula = _formula.substring(0, _formula.length-1);
      notifyListeners();
    } else if (_formula.length < _limit
        && !('+−×÷0'.contains(char)
        && '+−×÷'.contains(_formula[_formula.length-1]))) {
      _formula += char;
      notifyListeners();
    }
  }

  void proceed() {

  }
}