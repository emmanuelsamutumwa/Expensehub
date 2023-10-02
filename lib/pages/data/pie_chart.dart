import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:expensetracker/pages/models/expense_item.dart';

class ExpensePieChart extends StatefulWidget {
  final List<ExpenseItem> expenses;
  final String timePeriod; // Weekly, Monthly, Yearly, etc.

  ExpensePieChart({required this.expenses, required this.timePeriod});

  @override
  State<ExpensePieChart> createState() => _ExpensePieChartState();
}

class _ExpensePieChartState extends State<ExpensePieChart> {
  @override
  Widget build(BuildContext context) {
    // Create a list of PieChartSectionData based on your ExpenseItem data
    List<PieChartSectionData> pieChartSections = widget.expenses.map((expense) {
      // Define the value for the pie chart section based on the expense amount
      double value = expense.amount;

      // Assign specific colors to each category (you can add more colors)
      Color color;

      if (expense.category == 'Category1') {
        color = Colors.green;
      } else if (expense.category == 'Category2') {
        color = Colors.red;
      } else if (expense.category == 'Category3') {
        color = Colors.blue;
      } else if (expense.category == 'Category4') {
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

    // Create the PieChart widget with the defined data
    return PieChart(
      PieChartData(
        sections: pieChartSections,
        // You can customize other properties like center space radius, border data, etc.
      ),
    );
  }
}

