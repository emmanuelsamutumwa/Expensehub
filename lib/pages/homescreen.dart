import 'package:flutter/material.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {

  //text controller
  final newExpenseNameController =TextEditingController();
  final newExpenseAmountController = TextEditingController();

  //add new expense
  void addNewExpense () {
    showDialog(
        context: context,
        builder:(context) =>AlertDialog(
          title: Text ('Add new expenses'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //expense name
              TextField(
                controller: newExpenseNameController,
              ),

              //expense amount
              TextField(
                controller: newExpenseAmountController,
              )
            ],
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      floatingActionButton: FloatingActionButton(
        onPressed: addNewExpense,
        child: Icon(Icons.add),
      ),
    );
  }
}
