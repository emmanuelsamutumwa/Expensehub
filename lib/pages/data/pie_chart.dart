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
  List<PieChartSectionData> pieChartSections = [];
  String selectedCategory = 'Food'; // Initialize with a default category

  @override
  void initState() {
    super.initState();
    updatePieChartSections();
  }

  void updatePieChartSections() {
    final categoryMap = widget.expenses.groupBy((expense) => expense.category);
    pieChartSections = categoryMap.keys.map((category) {
      final expenses = categoryMap[category]!;
      double totalAmount = expenses.map((expense) => expense.amount).fold(0, (a, b) => a + b);
      Color color;

      // Assign colors based on category (you can customize these colors)
      if (category == 'Food') {
        color = Colors.green;
      } else if (category == 'Transportation') {
        color = Colors.red;
      } else if (category == 'Entertainment') {
        color = Colors.blue;
      } else if (category == 'others') {
        color = Colors.yellow;
      } else if (category == 'Category5') {
        color = Colors.orange;
      } else if (category == 'Category6') {
        color = Colors.pink;
      } else {
        color = Colors.brown; // Default color
      }

      return PieChartSectionData(
        color: color,
        value: totalAmount,
        title: category, // Category name
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
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
            });
          },
        ),
      ],
    );
  }
}

extension IterableExtensions<T> on Iterable<T> {
  Map<K, List<T>> groupBy<K>(K Function(T) keyFunction) {
    final result = <K, List<T>>{};
    for (final item in this) {
      final key = keyFunction(item);
      if (!result.containsKey(key)) {
        result[key] = <T>[];
      }
      result[key]!.add(item);
    }
    return result;
  }
}
