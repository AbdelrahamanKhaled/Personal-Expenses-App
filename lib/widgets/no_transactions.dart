import 'package:flutter/material.dart';

class NoTransactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Text('There is no more expenses to show',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 22,
                )),
            Container(
              height: constraints.maxHeight*0.7,
              child: Image.asset(
                'assets/images/zzz.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        );
      },
    );
  }
}
