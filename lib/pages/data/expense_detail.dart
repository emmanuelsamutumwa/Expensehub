import 'dart:io';

import 'package:flutter/material.dart';
import '../models/expense_item.dart';

class ExpenseDetailPage extends StatelessWidget {
  final ExpenseItem expense;

  ExpenseDetailPage({required this.expense});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detailed Information on ${expense.name}')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Expense Name: ${expense.name}'),
            Text('Category: ${expense.category}'),
            Text('Amount: ${expense.amount}'),
            Text('Date: ${expense.dateTime.toString()}'),
            if (expense.imagePath != null)
              Image.file(
                File(expense.imagePath!), // Assuming imagePath is a valid file path
                width: 300,
                height: 300,
              ),
          ],
        ),
      ),
    );
  }
}
