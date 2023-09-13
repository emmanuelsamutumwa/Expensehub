import 'package:expensetracker/pages/data/expense_data.dart';
import 'package:flutter/material.dart';
import 'package:expensetracker/pages/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) =>ExpenseData(),
        builder: (context, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Homepage(),
    ),
    );
  }
}
