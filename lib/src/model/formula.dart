import 'package:flutter/material.dart';

class FormulaModel with ChangeNotifier {
  String _formula = '';
  List<String> _rpnStack = [];
  static final _limit = 60;

  int _markIdx = 0;

  get formula => _formula;
  get rpnStack => _rpnStack;

  Text formulaText;

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

  void initText() {
    formulaText = Text(_formula, style: TextStyle(fontSize: 25));
    notifyListeners();
  }

  void proceed() {
    if (_markIdx + 1 < formulaText.data.length) {
      _markIdx ++;
    }
    formulaText = Text.rich(
      TextSpan(
        text: _formula.substring(0, _markIdx),
        style: TextStyle(fontSize: 25, color: Colors.blue),
        children: [
          TextSpan(
            text: _formula[_markIdx],
            style: TextStyle(color: Colors.red),
          ),
          _markIdx <= _formula.length
              ? TextSpan(
            text: _formula.substring(_markIdx + 1, _formula.length),
            style: TextStyle(color: Colors.black),
          )
              : TextSpan(
            text: '',
          ),
        ],
      ),
    );
    notifyListeners();
  }
}