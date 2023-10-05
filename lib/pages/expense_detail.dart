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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Expense Name: ${expense.name}'),
            Text('Category: ${expense.category}'),
            Text('Amount: ${expense.amount}'),
            Text('Date: ${DateFormat('yyyy-MM-dd HH:mm').format(expense.dateTime)}'),
            if (expense.location != null) // Check if location is available
              Column(
                children: [
                  Text('Latitude: ${expense.location!['latitude']}'),
                  Text('Longitude: ${expense.location!['longitude']}'),
                ],
              ),
            if (expense.imagePath != null)
              Image.file(
                File(expense.imagePath!), // Assuming imagePath is a valid file path
                width: 300,
                height: 300,
              ),
            if (expense.location != null) // Check if location is available
              Column(
                children: [
                  Text('Latitude: ${expense.location!['latitude']}'),
                  Text('Longitude: ${expense.location!['longitude']}'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
