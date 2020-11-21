import 'package:flutter/material.dart';
import 'widgets/land_scape_mode.dart';
import 'widgets/portrait_mode.dart';
import 'widgets/input_data.dart';
import 'models/transactions_class.dart';
import 'widgets/transactions_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      title: 'Personal Expenses',
      theme: ThemeData(
        cardColor: Color(0xffbb9457),
        scaffoldBackgroundColor: Color(0xffffe6a7),
        //The other color : 0xffffe6a7 ---0xffC7C0BD
        primarySwatch: Colors.brown,
        accentColor: Color(0xff6f1d1b),
        buttonColor: Colors.white,
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 20,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 20,
                ),
              ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transactions> _transactions = [
    Transactions(
      title: 'Shirt',
      amount: 150,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    ),
    Transactions(
      title: 'Short',
      amount: 100,
      date: DateTime.now().subtract(Duration(days: 1)),
      id: DateTime.now().subtract(Duration(days: 1)).toString(),
    ),
  ];

  List<Transactions> get _weeklyTransactions {
    return _transactions.where((trans) {
      return trans.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addTransaction(String title, double amount, DateTime pickedDate) {
    final _newTrans = new Transactions(
      title: title,
      amount: amount,
      date: pickedDate,
      id: pickedDate.toString(),
    );
    setState(() {
      _transactions.add(_newTrans);
    });
  }

  void _deleteTransaction(Transactions trans) {
    setState(() {
      _transactions.remove(trans);
    });
  }

  void _showModelSheet(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: InputData(_addTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    final appBar = AppBar(
      actions: [
        IconButton(
          icon: Icon(
            Icons.add,
          ),
          onPressed: () {
            _showModelSheet(context);
          },
        ),
      ],
      title: Text(
        'My Expenses',
      ),
    );
    final double _ignoredHeight =
        appBar.preferredSize.height + _mediaQuery.padding.top;

    bool _islandScapeMode =
        _mediaQuery.orientation == Orientation.landscape;

    final _txListWidget = Container(
      height: (_mediaQuery.size.height - _ignoredHeight) * 0.65,
      child: TransactionsList(_transactions, _deleteTransaction),
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: _islandScapeMode
            ? LandScapeMode(_txListWidget, _ignoredHeight, _weeklyTransactions)
            : PortraitMode(_txListWidget, _ignoredHeight, _weeklyTransactions),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: IconButton(
          icon: Icon(
            Icons.add,
            color: Theme.of(context).buttonColor,
          ),
        ),
        onPressed: () {
          _showModelSheet(context);
        },
      ),
    );
  }
}
