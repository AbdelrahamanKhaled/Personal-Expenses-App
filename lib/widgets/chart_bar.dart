import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String _day;
  final double _dailySpendings;
  final double _dailyPercentage;

  ChartBar(this._day, this._dailySpendings, this._dailyPercentage);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text(
                  '\$${_dailySpendings.toStringAsFixed(0)}',
                  style: TextStyle(
                    fontFamily:
                        Theme.of(context).textTheme.headline6.fontFamily,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              height: constraints.maxHeight * 0.6,
              width: 20,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                        color: Colors.grey,
                      ),
                      color: Theme.of(context).buttonColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: _dailyPercentage,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              height: constraints.maxHeight * 0.15,
              child: Text(
                _day,
                style: TextStyle(
                  fontFamily: Theme.of(context).textTheme.headline6.fontFamily,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
