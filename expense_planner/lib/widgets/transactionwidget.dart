import 'package:expense_planner/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListItem extends StatelessWidget {
  final Transaction trans;

  ListItem({required this.trans});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Row(
        children: <Widget>[
          Container(
            // color: Colors.lightBlue, // idk why yeh ek saath nahi de para color and borders ko
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
                color: Colors.lightBlue,
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 133, 166, 213),
                    blurRadius: 10.0,
                  ),
                ]),
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              '₹${trans.money.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  bottom: 8,
                ),
                child: Text(
                  trans.title as String,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: Text(
                  DateFormat('dd-MM-yyyy').format(trans.date),
                  style: const TextStyle(fontSize: 10, color: Colors.blueGrey),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
