import 'package:flutter/material.dart';
import '../models/transactions_class.dart';
import 'chart.dart';

class LandScapeMode extends StatefulWidget {
  final _txListWidget;
  final double _ignoredHeight;

  final List<Transactions> _weeklyTransactions;

  const LandScapeMode(
      this._txListWidget, this._ignoredHeight , this._weeklyTransactions);

  @override
  LandScapeModeState createState() => LandScapeModeState();
}

class LandScapeModeState extends State<LandScapeMode> {
  bool _switchVal = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Show Chart',style: TextStyle(
              color: Theme.of(context).accentColor,
              fontFamily: Theme.of(context).textTheme.headline6.fontFamily,
              fontSize: 20,
            ),
            ),
            Switch(
              value: _switchVal,
              onChanged: (val) {
                setState(() {
                  _switchVal = val;
                });
              },
            ),
          ],
        ),
        _switchVal
            ? Container(
                height: (MediaQuery.of(context).size.height -
                        widget._ignoredHeight) *
                    0.7,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Chart(widget._weeklyTransactions),
              )
            : widget._txListWidget,
      ],
    );
  }
}
