import 'package:flutter/material.dart';

class FormulaModel with ChangeNotifier {
  String _formula = '';
  final List<String> _rpnStack = [];
  static const _limit = 60;

  int _markIdx;

  String get formula => _formula;
  List<String> get rpnStack => _rpnStack;
  int get markIdx => _markIdx;

  void initIdx() {
    _markIdx = 0;
  }

  // 電卓エリアからの入力に対応する
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

  List<String> formulaToList() {
    final _list = <String>[];
    var _begin = 0;
    for (var i = 0; i < _formula.length; i ++) {
      // ignore: unnecessary_parenthesis
      if (('+−×÷').contains(_formula[i])) {
        _list
          ..add(_formula.substring(_begin, i))
          ..add(_formula[i]);
        _begin = i + 1;
      }
    }
    if (_begin <= _formula.length) {
      _list.add(_formula.substring(_begin, _formula.length));
    }
    notifyListeners();
    return _list;
  }
  
  bool checkFormula() {
    return (_formula.contains('+')
        || _formula.contains('−')
        || _formula.contains('×')
        || _formula.contains('÷'))
        && int.tryParse(_formula[0]) != null
        && int.tryParse(_formula[_formula.length - 1]) != null;
  }

  void proceed(int len) {
    if (_markIdx < len) {
      _markIdx ++;
    }
    notifyListeners();
  }
}