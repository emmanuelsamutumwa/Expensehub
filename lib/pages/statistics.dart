import 'package:expensetracker/pages/models/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expensetracker/pages/homescreen.dart';
import 'package:expensetracker/pages/settings.dart';
import 'package:expensetracker/widget/bottomnavigation.dart';
import 'package:provider/provider.dart'; // Import the provider package
import 'package:expensetracker/pages/data/expense_data.dart'; // Import your ExpenseData class
import 'package:expensetracker/pages/data/pie_chart.dart';



class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  int myIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Statistics"),
        centerTitle: true,
      ),
      body: Center(
        child: Consumer<ExpenseData>(
          builder: (context, expenseData, child) {
            List<ExpenseItem> expenses = expenseData.expenses;

            if (expenses.isEmpty) {
              return const Text("No expenses available");
            }
            return ExpensePieChart(
              expenses: expenses,
              timePeriod: "Daily",
            );
          },
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: myIndex,
        onTap: (index) {
          setState(() {
            myIndex = index;
          });

          switch (index) {
            case 0:
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ));
              break;
            case 1:
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Statistics(),
              ));
              break;
            case 2:
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Settings(),
              ));
              break;
          }
        },
      ),
    );
  }
}
