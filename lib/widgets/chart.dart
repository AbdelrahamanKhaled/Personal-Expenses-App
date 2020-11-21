import 'package:flutter/material.dart';
import '../widgets/chart_bar.dart';
import '../models/transactions_class.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transactions> _weeklyTransactions;

  Chart(this._weeklyTransactions);

  List<Map<String, Object>> get transactionsData {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalDailyAmount = 0;
      for (int i = 0; i < _weeklyTransactions.length; i++) {
        if (_weeklyTransactions[i].date.day == weekDay.day &&
            _weeklyTransactions[i].date.month == weekDay.month &&
            _weeklyTransactions[i].date.year == weekDay.year) {
          totalDailyAmount += _weeklyTransactions[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay),
        'amount': totalDailyAmount
      };
    });
  }

  double get _totalWeaklySpendings {
    return transactionsData.fold(0.0, (sum, trans) {
      return sum += trans['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: transactionsData.map(
          (trans) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                trans['day'],
                trans['amount'],
                _weeklyTransactions.isEmpty
                    ? 0.0
                    : (trans['amount'] as double) / _totalWeaklySpendings,
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
