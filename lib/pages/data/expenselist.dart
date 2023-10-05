import 'package:expensetracker/pages/expense_detail.dart';
import 'package:flutter/material.dart';
import 'package:expensetracker/pages/data/expense_data.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ExpenseList extends StatefulWidget {
  const ExpenseList({super.key});

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
                          padding: const EdgeInsets.only(right: 20.0),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        onDismissed: (direction) {
                          expenseData.removeExpense(index);
                        },
                        child: ListTile(
                          title: Text(expense.name),
                          subtitle: Text(DateFormat('HH:mm').format(expense.dateTime)),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('$selectedCurrency${expense.amount.toStringAsFixed(2)}'),
                              IconButton(
                                icon: const Icon(Icons.info),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Total: $selectedCurrency${expenseData.getTotalExpense().toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
