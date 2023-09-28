import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expensetracker/pages/data/expense_data.dart';

import '../models/expense_item.dart';

class AddExpenseDialog extends StatelessWidget {
  final TextEditingController expenseController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final List<String> categories = ['Food', 'Transportation', 'Entertainment', 'Others'];
  String selectedCategory = 'Food';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New Expense'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: expenseController,
            decoration: InputDecoration(labelText: 'Expense Name'),
          ),
          TextField(
            controller: amountController,
            decoration: InputDecoration(labelText: 'Amount'),
            keyboardType: TextInputType.number,
          ),
          DropdownButtonFormField(
            value: selectedCategory,
            items: categories.map((category) {
              return DropdownMenuItem(
                value: category,
                child: Text(category),
              );
            }).toList(),
            onChanged: (newValue) {
              selectedCategory = newValue.toString();
            },
            decoration: InputDecoration(labelText: 'Category'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            // Access the ExpenseData provider and add the expense
            String name = expenseController.text;
            double amount = double.parse(amountController.text);

            ExpenseItem newExpense = ExpenseItem(
              name: name,
              amount: amount,
              dateTime: DateTime.now(),
              category: selectedCategory, // Assuming ExpenseItem has a 'category' property
            );

            Provider.of<ExpenseData>(context, listen: false).addNewExpense(newExpense);

            Navigator.pop(context);
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}
