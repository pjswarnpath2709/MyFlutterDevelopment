// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'dart:io';

import 'package:expense_planner/widgets/adaptive_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function btnclick;

  NewTransaction(this.btnclick) {
    print('new Transaction Widget');
  }

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _tittlecontroller = TextEditingController();
  final _amountcontroller = TextEditingController();
  DateTime? _selectedDate;

  _NewTransactionState() {
    print('Constructor NewTransaction State');
  }

  //it is only called once when an state object is created hence , it is a state initialiser
  @override
  void initState() {
    //required when we are dealing with the web servers
    print('initState()');
    //iske upar  sara code likhna hai
    super.initState();
  }

//this is a method exists in parent class , when a widget is changed it is called
  @override
  void didUpdateWidget(covariant NewTransaction oldWidget) {
    // TODO: implement didUpdateWidget
    print('did update widget');
    super.didUpdateWidget(oldWidget);
  }

//when the state object is also deleted
  @override
  void dispose() {
    //this is used to clearing the data
    print('dispose');
    super.dispose();
  }

  void _submitData() {
    final String enterTitle = _tittlecontroller.text;
    final double enterAmount;
    if (_amountcontroller.text != '') {
      enterAmount = double.parse(_amountcontroller.text);
    } else {
      enterAmount = 0;
    }

    if (enterTitle == null ||
        enterAmount <= 0 ||
        enterAmount == null ||
        _selectedDate == null) {
      return;
    }
    widget.btnclick(
      enterTitle,
      enterAmount,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 8,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: const InputDecoration(labelText: 'Tittle'),
                  controller: _tittlecontroller,
                  keyboardType: TextInputType.text,
                  onSubmitted: (_) => _submitData(),
                  // onChanged: (text) {
                  //   titleInput = text;
                  // },
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Amount'),
                  controller: _amountcontroller,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) =>
                      _submitData(), //i dont want to use that value
                  // onChanged: (text) {
                  //   amountInput = text;
                  // },
                ),
                Container(
                  height: 70,
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        fit: FlexFit.tight,
                        child: Text(
                          _selectedDate == null
                              ? 'No Date Choosen!'
                              : "Picked Date: ${DateFormat.yMMMd().format(_selectedDate!)}",
                        ),
                      ),
                      AdaptiveFlatButton(
                        datePicker: _presentDatePicker,
                        text: 'Choose Date',
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: _submitData,
                  child: const Text(
                    'Add Transaction',
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
