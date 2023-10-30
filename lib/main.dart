import 'package:expensetracker/pages/data/expense_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:expensetracker/pages/home.dart';
import 'package:provider/provider.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
