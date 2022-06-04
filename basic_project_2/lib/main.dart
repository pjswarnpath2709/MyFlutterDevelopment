import 'package:basic_project_2/widgets/chart.dart';
import 'package:basic_project_2/widgets/new_transaction.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import '../models/transaction.dart';
import '../widgets/transaction_list.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontFamily: 'Amatic',
                fontSize: 36,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              titleMedium: const TextStyle(
                fontFamily: 'Amatic',
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              titleSmall: const TextStyle(
                fontFamily: 'Amatic',
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                titleLarge: const TextStyle(
                  fontFamily: 'Amatic',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                titleMedium: const TextStyle(
                  fontFamily: 'Amatic',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                titleSmall: const TextStyle(
                  fontFamily: 'Amatic',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      title: 'Expense Manager',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
//yaha pe ayenge saare ke saare variables------------------
//-------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------
  bool _showChart = false;

  final List<Transaction> _userTransactions = [
    // Transaction(`
    //   tittle: 'Tittle',
    //   amount: 0.0,
    //   date: DateTime.now(),
    //   id: DateTime.now().toString(),
    // ),
    // Transaction(
    //   tittle: 'Tittle',
    //   amount: 0.0,
    //   date: DateTime.now(),
    //   id: DateTime.now().toString(),
    // ),
  ];

//yaha pe ayenge saare functions-----------------------------
//-------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _deleteTransaction(String deleteId) {
    setState(() {
      _userTransactions.removeWhere((element) {
        return element.id == deleteId;
      });
    });
  }

  void addTransactionToList(
    String tittle,
    double amount,
    DateTime date,
  ) {
    final tx = Transaction(
      tittle: tittle,
      amount: amount,
      date: date,
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransactions.add(tx);
    });
  }

  void openNewTransactionWindow(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(
            btnclick: addTransactionToList,
          );
        });
  }

//-------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------

  /* --------------------------------------------------------*/
  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
//-------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------

    final appBar = AppBar(
      title: Text(
        'Expense Manager',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      actions: [
        IconButton(
          onPressed: () {
            openNewTransactionWindow(context);
          },
          icon: const Icon(
            Icons.add,
          ),
        )
      ],
      textTheme: Theme.of(context).textTheme,
    );

    final txList = Container(
      height: (MediaQuery.of(context).size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top) *
          0.7,
      alignment: Alignment.center,
      child: TransactionList(
        transactions: _userTransactions,
        deleteTransaction: _deleteTransaction,
      ),
    );

    final pageBody = SafeArea(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isLandscape)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Show Chart',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
                Switch.adaptive(
                    value: _showChart,
                    onChanged: (val) {
                      setState(() {
                        _showChart = val;
                      });
                    }),
              ],
            ),
          if (!isLandscape)
            Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.3,
                child: Chart(_recentTransactions)),
          if (!isLandscape) txList,
          if (isLandscape)
            _showChart
                ? Container(
                    height: (MediaQuery.of(context).size.height -
                            appBar.preferredSize.height -
                            MediaQuery.of(context).padding.top) *
                        0.7,
                    child: Chart(_recentTransactions))
                : txList
        ],
      ),
    ));
//-------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: const Text('Expense Manager'),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                GestureDetector(
                  child: const Icon(CupertinoIcons.add),
                  onTap: () {
                    openNewTransactionWindow(context);
                  },
                )
              ]),
            ),
            child: pageBody,
          )
        : Scaffold(
            //appbar-------------------------------------------------
            //appbar-------------------------------------------------
            //appbar-------------------------------------------------
            appBar: appBar,
            //body-------------------------------------------------
            //body-------------------------------------------------
            //body-------------------------------------------------
            body: pageBody,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    onPressed: () {
                      openNewTransactionWindow(context);
                    },
                    child: const Icon(
                      Icons.add,
                    )),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          );
  }
}

//-------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------
