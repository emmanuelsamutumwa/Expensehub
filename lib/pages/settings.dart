import 'package:expensetracker/pages/signin.dart';
import 'package:expensetracker/pages/statistics.dart';
import 'package:expensetracker/widget/bottomnavigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expensetracker/pages/data/expense_data.dart';
import 'homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Settings extends StatefulWidget {
  Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int myIndex = 2;

  void _resetSettings() {
    Provider.of<ExpenseData>(context, listen: false).updateCurrency('USD');
  }

  //sign out method
  Future<void> _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pop(); // Close the confirmation dialog
    // Navigate to sign-in screen
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => SignIn(), // Replace with your sign in screen
    ));
  }

  //confirmation dialog method
  Future<void> _showSignOutConfirmationDialog(BuildContext context) async {
    bool isSigningOut = false;

    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button for close
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text('Sign Out'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Are you sure you want to sign out?'),
                    if (isSigningOut) CircularProgressIndicator(), // Show loading icon if signing out
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(dialogContext).pop(); // Close the dialog
                  },
                ),
                TextButton(
                  onPressed: isSigningOut
                      ? null
                      : () async {
                    setState(() {
                      isSigningOut = true;
                    });
                    // Simulate a 5-second sign out process
                    await Future.delayed(Duration(seconds: 2));
                    await _signOut(context);
                    Navigator.of(dialogContext).pop(); // Close the dialog
                  },
                  child: Text('Sign Out'),
                ),
              ],
            );
          },
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    String selectedCurrency = Provider.of<ExpenseData>(context).selectedCurrency;

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: myIndex,
          onTap:(index){
            setState(() {
              myIndex=index;
            });
            switch (index) {
              case 0:
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HomeScreen(),
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
          }
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: const Text('Currency'),
            leading: const Icon(Icons.currency_exchange),
            trailing: DropdownButton<String>(
              value: selectedCurrency,
              onChanged: (String? newValue) {
                Provider.of<ExpenseData>(context, listen: false).updateCurrency(newValue!);
              },
              items: <String>['USD', 'EUR', 'GBP', 'ZMW', 'ZAR']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          const Divider(),
          ListTile(
            title: Text('Reset Settings'),
            onTap: _resetSettings,
          ),
          const Divider(),
          ListTile(
            title: Text ("Sign Out"),
            onTap: () =>  _showSignOutConfirmationDialog(context),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
