import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList({
    required this.transactions,
    required this.deleteTransaction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480,
      alignment: Alignment.center,
      child: transactions.length == 0
          ? Image.asset(
              'assets/images/emptyimage.gif',
              fit: BoxFit.cover,
              alignment: Alignment.centerRight,
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Container(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: FittedBox(
                        child: Text(
                          '₹${transactions[index].amount}',
                        ),
                      ),
                    ),
                    title: Text(transactions[index].tittle),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                      style:
                          Theme.of(context).appBarTheme.textTheme!.titleSmall,
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () {
                        deleteTransaction(transactions[index].id);
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
