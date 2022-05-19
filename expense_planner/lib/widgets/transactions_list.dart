import 'package:expense_planner/models/transaction.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import './transactionwidget.dart';

class MyList extends StatelessWidget {
  final List<Transaction> transactions;
  MyList({required this.transactions});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return ListItem(trans: transactions[index]);
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
