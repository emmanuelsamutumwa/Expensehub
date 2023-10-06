import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:expensetracker/pages/models/expense_item.dart';

class ExpensePieChart extends StatefulWidget {
  final List<ExpenseItem> expenses;
  final String timePeriod; // Weekly, Monthly, Yearly, etc.

  const ExpensePieChart({super.key, required this.expenses, required this.timePeriod});

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
        const SizedBox(height: 20),
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
        const SizedBox(height:40),
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
                        } else if (entry.key == 'Medical') {
                          color = Colors.yellow;
                        } else if (entry.key == 'Utilities') {
                          color = Colors.orange;
                        } else if (entry.key == 'Others') {
                          color = Colors.pink;
                        } else {
                          color = Colors.brown; // Default color
                        }

                        return PieChartSectionData(
                          color: color,
                          value: totalAmount,
                          title: '',
                        );
                      })
                          .toList(),
                      // You can customize other properties like center space radius, border data, etc.
                    ),
                  ),
                ),
                // Display category totals
                Column(
                  children: categoryTotals.entries.map((entry) {
                    final category = entry.key;
                    final total = entry.value;
                    final color = getCategoryColor(category);

                    return ListTile(
                      leading: Container(
                        width: 12,
                        height: 12,
                        color: color,
                      ),
                      title: Text('$category: \$${total.toStringAsFixed(2)}'),
                    );
                  }).toList(),
                ),
                // Display the total at the bottom with a larger font size
                Text(
                  'Total: \$${categoryTotals.values.reduce((a, b) => a + b).toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18), // Adjust the font size as needed
                ),
              ],
            ),
          ),
      ],
    );
  }

  Color getCategoryColor(String category) {
    switch (category) {
      case 'Food':
        return Colors.green;
      case 'Transportation':
        return Colors.red;
      case 'Entertainment':
        return Colors.blue;
      case 'Medical':
        return Colors.yellow;
      case 'Utilities':
        return Colors.orange;
      case 'Others':
        return Colors.pink;
      default:
        return Colors.brown; // Default color
    }
  }
}
