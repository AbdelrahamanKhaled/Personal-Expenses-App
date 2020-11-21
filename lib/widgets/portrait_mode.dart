import 'package:flutter/material.dart';
import '../models/transactions_class.dart';
import 'chart.dart';

class PortraitMode extends StatelessWidget {
  final _txListWidget;
  final double _ignoredHeight;

  final List<Transactions> _weeklyTransactions;

  const PortraitMode(
      this._txListWidget, this._ignoredHeight, this._weeklyTransactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: (MediaQuery.of(context).size.height - _ignoredHeight) * 0.3,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Chart(_weeklyTransactions),
        ),
        _txListWidget,
      ],
    );
  }
}
