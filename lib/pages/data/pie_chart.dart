import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import 'package:expensetracker/pages/data/expense_data.dart';
import 'package:expensetracker/pages/models/expense_item.dart';

class ExpensePieChart extends StatefulWidget {
  final List<ExpenseItem> expenses;
  final String timePeriod; // Weekly, Monthly, Yearly, etc.

  ExpensePieChart({required this.expenses, required this.timePeriod});

  @override
  State<ExpensePieChart> createState() => _ExpensePieChartState();
}

class _ExpensePieChartState extends State<ExpensePieChart> {
  String selectedCategory = 'Food'; // Initialize with a default category
  double totalAmountSpentForCategory = 0.0;

  @override
  void initState() {
    super.initState();
    updateTotalAmountSpentForCategory();
  }

  void updateTotalAmountSpentForCategory() {
    // Calculate the total amount spent for the selected category
    totalAmountSpentForCategory = widget.expenses
        .where((expense) => expense.category == selectedCategory)
        .map((expense) => expense.amount)
        .fold(0, (a, b) => a + b);
  }

  @override
  Widget build(BuildContext context) {
    // Create a list of PieChartSectionData based on your ExpenseItem data
    List<PieChartSectionData> pieChartSections = widget.expenses.map((expense) {
      // Define the value for the pie chart section based on the expense amount
      double value = expense.amount;

      // Assign specific colors to each category (you can add more colors)
      Color color;

      if (expense.category == 'Food') {
        color = Colors.green;
      } else if (expense.category == 'Transportation') {
        color = Colors.red;
      } else if (expense.category == 'Entertainment') {
        color = Colors.blue;
      } else if (expense.category == 'others') {
        color = Colors.yellow;
      } else if (expense.category == 'Category5') {
        color = Colors.orange;
      } else if (expense.category == 'Category6') {
        color = Colors.pink;
      } else {
        color = Colors.brown; // Default color
      }

      // Create a PieChartSectionData for this expense
      return PieChartSectionData(
        color: color,
        value: value,
        title: expense.category, // You can customize this label as needed
      );
    }).toList();

    return Column(
      children: [
        // Pie chart
        Expanded(
          child: PieChart(
            PieChartData(
              sections: pieChartSections,
              // You can customize other properties like center space radius, border data, etc.
            ),
          ),
        ),
        // Dropdown to select a category
        DropdownButton<String>(
          value: selectedCategory,
          items: widget.expenses
              .map((expense) => expense.category)
              .toSet()
              .map((category) {
            return DropdownMenuItem<String>(
              value: category,
              child: Text(category),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedCategory = newValue ?? 'Food';
              updateTotalAmountSpentForCategory();
            });
          },
        ),
        // Display the total amount spent for the selected category
        Text('Total Amount Spent: \$${totalAmountSpentForCategory.toStringAsFixed(2)}'),
      ],
    );
  }
}

