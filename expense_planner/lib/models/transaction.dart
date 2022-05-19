import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String title;
  final double money;
  final DateTime date; //concept of the nullables is here baby

  Transaction({
    required this.id,
    required this.money,
    required this.title,
    required this.date,
  });
}
