import 'package:flutter/material.dart';
import 'package:expensetracker/pages/data/expense_data.dart';
import 'package:expensetracker/pages/data/expenselist.dart';
import 'package:expensetracker/pages/settings.dart';
import 'package:expensetracker/pages/statistics.dart';
import 'package:expensetracker/Geo/Geolocater.dart';
import 'package:provider/provider.dart';
import 'package:expensetracker/widget/bottomnavigation.dart';
import 'data/addExpenseDialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int myIndex = 0;

  void addNewExpense(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AddExpenseDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, expenseData, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Expense Tracker"),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => addNewExpense(context),
            child: const Icon(Icons.add),
          ),
          body: ExpenseList(),
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
                    builder: (context) => Statistics(),
                  ));
                  break;
                case 2:
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Settings(),
                  ));
                  break;
              }
            },
          ),
        );
      },
    );
  }
}
