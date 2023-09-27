import 'package:expensetracker/pages/data/expense_data.dart';
import 'package:expensetracker/pages/models/expense_item.dart';
import 'package:expensetracker/pages/settings.dart';
import 'package:expensetracker/pages/statistics.dart';
import 'package:expensetracker/Geo/Geolocater.dart' ;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {

  //text controller
  final newExpenseNameController =TextEditingController();
  final newExpenseAmountController = TextEditingController();

  //add new expense method
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
                decoration: InputDecoration(
                  hintText: 'Expense'
                ),
                controller: newExpenseNameController,
              ),

              //expense amount
              TextField(
                decoration: InputDecoration(
                  hintText: 'Amount'
                ) ,
                controller: newExpenseAmountController,
              )
            ],
          ),

          actions: [
            //save button
            MaterialButton(
                onPressed: save,
                child: Text('Save'),
            ),
            //cancel button
            MaterialButton(
              onPressed: cancel,
              child: Text('Cancel'),
            )


          ],
        )
    );
  }
  //save method
  void save(){
    //create new expense item
    ExpenseItem newExpense = ExpenseItem(
        name: newExpenseNameController.text,
        amount: newExpenseAmountController.text,
        dateTime: DateTime.now(),
    );

    //add the new expense save button method
    Provider.of<ExpenseData>(context, listen: false).addNewExpense(newExpense);

    Navigator.pop(context);
    clear();

  }
  //cancel button method
  void cancel(){
    Navigator.pop(context);
    clear();
  }

  // method to clear already entered expense in pop up
  void clear () {
    newExpenseNameController.clear();
    newExpenseAmountController.clear();
  }
  //state variable
  int myIndex=0;

  @override
  Widget build(BuildContext context) {
    return Consumer <ExpenseData> (
        builder: (context, value, child) => Scaffold(
          backgroundColor: Colors.grey,
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                myIndex = index;
              });

              switch (index) {
                case 0:
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => homescreen(),
                  ));
                  break;
                case 1:
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => statistics(),
                  ));
                  break;
                case 2:
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => settings(),
                  ));
                  break;
              }
            },
            currentIndex: myIndex,
            type: BottomNavigationBarType.fixed,
            items: const[
              BottomNavigationBarItem(icon: Icon(Icons.home),
              label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.bar_chart),
                  label: "Statistics"),
              BottomNavigationBarItem(icon: Icon(Icons.settings),
                  label: "Settings"),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: addNewExpense,
            child: Icon(Icons.add),
          ),
          body: ListView.builder(
            itemCount: value.getAllExpenseList().length,
            itemBuilder: (context, index) => ListTile(
                title: Text(value.getAllExpenseList()[index].name),
              subtitle: Text(value.getAllExpenseList() [index].dateTime.toString()),
              trailing: Text('\K' + value.getAllExpenseList()[index].amount),
            ),
          ),
        ),
    );
  }
}
