import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpn_sample_app/src/model/formula.dart';

import 'components/input_page.dart';
import 'components/simulate_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FormulaModel>(
      create: (_) => FormulaModel(),
      child: MaterialApp(
        title: 'RPN demo',
        initialRoute: '/',
        routes: <String, WidgetBuilder> {
          '/': (BuildContext context) => InputPage(),
          '/demo': (BuildContext context) => SimulatePage(),
        },
      ),
    );
  }
}