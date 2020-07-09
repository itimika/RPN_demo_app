import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/formula.dart';


class SimulatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<FormulaModel>(context).initText();
    return Scaffold(
      appBar: AppBar(title: Text('RPN Demo')),
      body: Column(
        children: <Widget>[
          // TEXT()
          MaterialButton(
            onPressed: Provider.of<FormulaModel>(context, listen: false).proceed,
            child: const Text('NEXT!', style:  TextStyle(fontSize: 30)),
          ),
        ],
      ),
    );
  }
}