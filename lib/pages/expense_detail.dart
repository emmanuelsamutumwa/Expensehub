import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'models/expense_item.dart';

class ExpenseDetailPage extends StatelessWidget {
  final ExpenseItem expense;

  const ExpenseDetailPage({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detailed Information on ${expense.name}')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height:50),
            Text('Expense Name: ${expense.name}',
                style: const TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 25)),
            const SizedBox(height: 10),
            Text('Category: ${expense.category}',
              style: const TextStyle(fontSize: 20),),
            const SizedBox(height: 10),
            Text('Amount: ${expense.amount}',
              style: const TextStyle(fontSize: 20),),
            const SizedBox(height: 10),
            if (expense.imagePath != null)
              Image.file(
                File(expense.imagePath!), // Assuming imagePath is a valid file path
                width: 300,
                height: 300,
              ),
            const SizedBox(height: 20),
            Text('Date: ${DateFormat('dd-MM-yyyy HH:mm').format(expense.dateTime)}',
            style: const TextStyle(fontSize: 15),)
          ],
        ),
      ),
    );
  }
}
