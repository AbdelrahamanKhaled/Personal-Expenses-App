import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import '../models/transactions_class.dart';

class InputData extends StatefulWidget {
  final Function _addTransaction;

  InputData(this._addTransaction);

  @override
  InputDataState createState() => InputDataState();
}

class InputDataState extends State<InputData> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _pickedDate;

  void _submitData() {
    if (_titleController.text.isEmpty ||
        double.parse(_amountController.text.toString()) <= 0) {
      return;
    }
    widget._addTransaction(
      _titleController.text,
      double.parse(
        _amountController.text.toString(),
      ),
      _pickedDate,
    );
  }

  void _pickDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pDate) {
      if (pDate == null) return;
      setState(() {
        _pickedDate = pDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        //padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom+10 , right: 10, left: 10 , top: 10,),
        child: Card(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).accentColor,
                ),
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                    fontWeight: FontWeight.bold,
                    fontFamily:
                        Theme.of(context).textTheme.headline6.fontFamily,
                  ),
                  labelText: 'title',
                ),
                controller: _titleController,
              ),
              TextField(
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).accentColor,
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                    fontWeight: FontWeight.bold,
                    fontFamily:
                        Theme.of(context).textTheme.headline6.fontFamily,
                  ),
                  labelText: 'amount',
                ),
                controller: _amountController,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    _pickedDate == null
                        ? 'Choose a date'
                        : '${DateFormat.yMMMd().format(_pickedDate)}',
                    style: TextStyle(
                      color: Theme.of(context).primaryColorDark,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily:
                          Theme.of(context).textTheme.headline6.fontFamily,
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    color: Theme.of(context).accentColor,
                    onPressed: _pickDate,
                    iconSize: 28,
                  ),
                ],
              ),
              FlatButton(
                color: Theme.of(context).accentColor,
                child: Text(
                  'add',
                  style: TextStyle(
                    color: Theme.of(context).buttonColor,
                    fontFamily:
                        Theme.of(context).textTheme.headline6.fontFamily,
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  _submitData();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
