import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/formula.dart';

class SimulatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RPN Demo')),
      body: Column(
        children: <Widget>[
          Consumer<FormulaModel>(
            builder: (_, model, __) {
              return Text(model.formula);
            },
          ),
        ],
      ),
    );
  }
}