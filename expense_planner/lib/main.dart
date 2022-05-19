import './widgets/new_transaction.dart';
import 'package:intl/intl.dart';
import 'models/transaction.dart';
import 'package:flutter/material.dart';

import 'widgets/transactions_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Project',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _usertransactions = [
    Transaction(
      id: 't1',
      money: 100,
      title: 'Shirts',
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      money: 69.99,
      title: 'Weekly Grocery',
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      money: 89.99,
      title: 'Car Expenses',
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
      title: title,
      money: amount,
      id: DateTime.now().toString(),
      date: DateTime.now(),
    );

    setState(() {
      _usertransactions.add(newTx);
    });
  }

  void _startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addNewTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Manager'),
        actions: [
          IconButton(
            onPressed: () {
              _startNewTransaction(context);
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              color: Colors.lightBlue,
              elevation: 8,
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: const Text(
                  'THIS IS CHART!',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            MyList(
              transactions: _usertransactions,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        onPressed: () {
          _startNewTransaction(context);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
