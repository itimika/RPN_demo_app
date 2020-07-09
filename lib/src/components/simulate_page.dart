import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/formula.dart';

class SimulatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final list = Provider
        .of<FormulaModel>(context, listen: false)
        .formulaToList();
    return Scaffold(
      appBar: AppBar(title: const Text('RPN Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Consumer<FormulaModel>(
              builder: (_, model, __) {
                return Text.rich(
                  TextSpan(
                    text: model.markIdx < list.length
                        ? list.sublist(0, model.markIdx).join()
                        : list.sublist(0, list.length).join(),
                    style: TextStyle(fontSize: 30, color: Colors.blue),
                    children: [
                      TextSpan(
                        text: model.markIdx < list.length
                            ? list[model.markIdx]
                            : '',
                        style: TextStyle(color: Colors.red),
                      ),
                      TextSpan(
                        text: model.markIdx + 1 < list.length
                            ? list.sublist(model.markIdx+1, list.length).join()
                            : '',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                );
              },
            ),
            MaterialButton(
              onPressed: () =>
                  Provider
                      .of<FormulaModel>(context, listen: false)
                      .proceed(list.length),
              child: const Text('NEXT!', style:  TextStyle(fontSize: 30)),
            ),
          ],
        ),
      ),
    );
  }
}