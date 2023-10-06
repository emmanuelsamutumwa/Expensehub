import 'package:expensetracker/pages/expense_detail.dart';
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
        String selectedCurrency =
            Provider.of<ExpenseData>(context).selectedCurrency;

        double totalExpenses = 0;

        // Calculate total expenses
        for (var expense in expenseData.expenses) {
          totalExpenses += expense.amount;
        }

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: expenseData.expenses.length,
                itemBuilder: (context, index) {
                  var expense = expenseData.expenses[index];
                  return Column(
                    children: [
                      Dismissible(
                        key: Key(expense.name),
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 20.0),
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                        onDismissed: (direction) {
                          expenseData.removeExpense(index);
                        },
                        child: ListTile(
                          title: Text(expense.name),
                          subtitle: Text('Date: ${DateFormat('dd-MM-yyyy HH:mm').format(expense.dateTime)}'),

                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('$selectedCurrency${expense.amount.toStringAsFixed(2)}'),
                              IconButton(
                                icon: Icon(Icons.info),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ExpenseDetailPage(expense: expense),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.grey[200],
              child: Text(
                'Total Expenses: $selectedCurrency${totalExpenses.toStringAsFixed(2)}',
                style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 20),
              ),
            ),
          ],
        );
      },
    );
  }
}
