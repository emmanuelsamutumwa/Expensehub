import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ExpenseItem {
  final String name;
  final String amount;
  final DateTime dateTime;
  
  ExpenseItem({
  required this.name,
  required this.amount,
  required this.dateTime
  });

}