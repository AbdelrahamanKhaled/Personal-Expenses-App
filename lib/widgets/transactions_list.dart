import 'package:flutter/material.dart';
import '../models/transactions_class.dart';
import 'package:intl/intl.dart';
import 'no_transactions.dart';

class TransactionsList extends StatelessWidget {
  final List<Transactions> transactions;
  final Function deleteTransaction;

  TransactionsList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? NoTransactions()
          : ListView.builder(
              itemBuilder: (cxt, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            '\$${transactions[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontFamily: Theme.of(context).textTheme.headline6.fontFamily,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: TextStyle(
                        fontFamily: Theme.of(context).textTheme.headline6.fontFamily,
                        fontSize: 22,
                      ),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                      style: TextStyle(
                        fontFamily: Theme.of(context).textTheme.headline6.fontFamily,
                        fontSize: 14,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        size: 40,
                        color: Theme.of(context).accentColor,
                      ),
                      onPressed: () {
                        deleteTransaction(transactions[index]);
                      },
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
