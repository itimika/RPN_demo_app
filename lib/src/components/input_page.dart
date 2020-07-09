import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/formula.dart';
import '../model/size_config.dart';

class InputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(title: const Text('RPN Sample App')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              children: <Widget>[
                Consumer<FormulaModel>(
                  builder: (_, model, __) {
                    return Text(
                      model.formula,
                      style: const TextStyle(
                        fontSize: 30,
                      ),
                    );
                  },
                ),
                const Divider(),
              ],
            ),
          ),
          Expanded(
            child: MaterialButton(
              onPressed: () => Navigator.pushNamed(context, '/demo'),
              child: const Text(
                'Demo RPN calculate',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: SizedBox(
              height: SizeConfig.width ,
              width: SizeConfig.width,
              child: GridView.count(
                crossAxisCount: 4,
                children: <Widget> [
                  _buildButton(context, '7'),
                  _buildButton(context, '8'),
                  _buildButton(context, '9'),
                  _buildButton(context, '÷'),
                  _buildButton(context, '4'),
                  _buildButton(context, '5'),
                  _buildButton(context, '6'),
                  _buildButton(context, '×'),
                  _buildButton(context, '1'),
                  _buildButton(context, '2'),
                  _buildButton(context, '3'),
                  _buildButton(context, '−'),
                  _buildButton(context, 'C'),
                  _buildButton(context, '0'),
                  _buildButton(context, 'back'),
                  _buildButton(context, '+'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String char) {
    return MaterialButton(
      onPressed: () => Provider.of<FormulaModel>(context, listen: false).inputChar(char),
      color: Colors.white70,
      child: char == 'back'
          ? const Icon(Icons.backspace)
          : Text(char, style: const TextStyle(fontSize: 20)),
    );
  }
}
