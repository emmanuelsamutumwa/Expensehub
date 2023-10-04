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
  Map<String, double> categoryTotals = {}; // Store category-wise totals
  String selectedCategory = 'All'; // Initialize with "All" category

  @override
  void initState() {
    super.initState();
    calculateCategoryTotals();
  }

  void calculateCategoryTotals() {
    categoryTotals.clear(); // Clear existing totals
    for (var expense in widget.expenses) {
      final category = expense.category;
      final amount = expense.amount;
      categoryTotals[category] = (categoryTotals[category] ?? 0) + amount;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Dropdown to select a category
        DropdownButton<String>(
          value: selectedCategory,
          items: ['All', ...categoryTotals.keys.toList()].map((category) {
            return DropdownMenuItem<String>(
              value: category,
              child: Text(category),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedCategory = newValue ?? '';
            });
          },
        ),
        // Show the pie chart or category breakdown
        if (selectedCategory != 'All')
          Expanded(
            child: Column(
              children: widget.expenses
                  .where((expense) => expense.category == selectedCategory)
                  .map((expense) {
                final name = expense.name;
                final amount = expense.amount;

                return Text('$name: \$${amount.toStringAsFixed(2)}');
              })
                  .toList(),
            ),
          )
        else
        // Show a smaller pie chart with text showing categories and totals
          Expanded(
            child: Column(
              children: [
                // Pie chart
                AspectRatio(
                  aspectRatio: 1.3,
                  child: PieChart(
                    PieChartData(
                      sections: categoryTotals.entries
                          .map((entry) {
                        final totalAmount = entry.value;

                        // Assign specific colors to each category (you can add more colors)
                        Color color;

                        if (entry.key == 'Food') {
                          color = Colors.green;
                        } else if (entry.key == 'Transportation') {
                          color = Colors.red;
                        } else if (entry.key == 'Entertainment') {
                          color = Colors.blue;
                        } else if (entry.key == 'Others') {
                          color = Colors.yellow;
                        } else if (entry.key == 'Category5') {
                          color = Colors.orange;
                        } else if (entry.key == 'Category6') {
                          color = Colors.pink;
                        } else {
                          color = Colors.brown; // Default color
                        }

                        return PieChartSectionData(
                          color: color,
                          value: totalAmount,
                          title: entry.key,
                        );
                      })
                          .toList(),
                      // You can customize other properties like center space radius, border data, etc.
                    ),
                  ),
                ),
                // Display category totals
                ...categoryTotals.entries.map((entry) {
                  final category = entry.key;
                  final total = entry.value;

                  return Text('$category: \$${total.toStringAsFixed(2)}');
                }).toList(),
              ],
            ),
          ),
      ],
    );
  }
}