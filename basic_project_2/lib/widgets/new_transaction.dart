import 'package:flutter/material.dart';
import 'dart:io';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function btnclick;
  NewTransaction({required this.btnclick});
  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _tittlecontroller = TextEditingController();
  final _amountcontroller = TextEditingController();

  void openDateChooser() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime.now())
        .then((chosenDate) {
      if (chosenDate == null) {
        return;
      }
      setState(() {
        _selectedDate = chosenDate;
      });
    });
  }

  DateTime? _selectedDate;
  void _submitData() {
    final String enterTitle = _tittlecontroller.text;
    final double? enterAmount;
    if (_amountcontroller.text != "") {
      enterAmount = double.parse(_amountcontroller.text);
    } else {
      enterAmount = null;
    }

    if (enterTitle == null ||
        enterAmount == null ||
        enterAmount <= 0 ||
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(
            left: 10,
            top: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                style: const TextStyle(
                  fontSize: 20,
                ),
                controller: _tittlecontroller,
                keyboardType: TextInputType.text,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                style: const TextStyle(
                  fontSize: 20,
                ),
                controller: _amountcontroller,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                child: Row(children: [
                  Text(
                    _selectedDate == null
                        ? 'choosen date!'
                        : DateFormat().add_yMMMd().format(_selectedDate!),
                  ),
                  IconButton(
                    onPressed: openDateChooser,
                    icon: const Icon(Icons.date_range),
                    color: Colors.purple,
                  )
                ]),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    _submitData();
                  },
                  child: const Text('Add Transaction'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
