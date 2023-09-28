import 'package:flutter/material.dart';
import 'package:expensetracker/pages/data/expense_data.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';


class ExpenseList extends StatefulWidget {
  @override
  State<ExpenseList> createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, expenseData, child) {
        return ListView.builder(
          itemCount: expenseData.expenses.length,
          itemBuilder: (context, index) {
            var expense = expenseData.expenses[index];
            return Dismissible(
              key: Key(expense.name),
              // Provide a unique key for each item
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 20.0),
                child: Icon(Icons.delete, color: Colors.white),
              ),
              onDismissed: (direction) {
                // Remove the item from the data provider
                expenseData.removeExpense(index);
              },
              child: ListTile(
                title: Text(expense.name),
                  subtitle: Text(DateFormat('HH:mm').format(expense.dateTime)),
                trailing: Text('K${expense.amount.toStringAsFixed(2)}'),
              ),
            );
          },
        );
      },
    );
  }
}
