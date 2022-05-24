import 'package:expense_planner/models/transaction.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import './transactionwidget.dart';

class MyList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  MyList({required this.transactions, required this.deleteTransaction});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No Transactions Added yet!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 300,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return ListItem(
                  trans: transactions[index],
                  deleteItem: deleteTransaction,
                );
              },
              itemCount: transactions.length,
              //   children: <Widget>[
              //     ...transactions.map((transaction) {
              //       return ListItem(
              //         trans: transaction,
              //       );
              //     }).toList(), //yeh to list lagana jaroori hai re bhiaya
              //   ],
              // ),
            ),
    );
  }
}
