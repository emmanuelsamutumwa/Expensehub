import 'package:expensetracker/pages/signin.dart';
import 'package:expensetracker/pages/statistics.dart';
import 'package:expensetracker/widget/bottomnavigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expensetracker/pages/data/expense_data.dart';
import 'homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isDarkMode = false;
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
      builder: (context) => const SignIn(), //Takes ypu to the signIn screen
    ));
  }

  //Dark mode switch alert dialog method
  void _showFutureFeatureDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Future Feature'),
          content: Text('This feature will come in future updates.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                setState(() {
                  isDarkMode = false; // Set isDarkMode back to false
                });
                Navigator.of(dialogContext).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
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
              title: const Text('Sign Out'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    const Text('Are you sure you want to sign out?'),
                    if (isSigningOut) const CircularProgressIndicator(), // Show loading icon if signing out
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancel'),
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
                    // Simulate a 2-second sign out process
                    await Future.delayed(const Duration(seconds: 2));
                    await _signOut(context);
                    Navigator.of(dialogContext).pop(); // Close the dialog
                  },
                  child: const Text('Sign Out'),
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
        title: const Text("Settings"),
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
          }
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
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
            title: const Text ("Dark Mode"),
            leading: const Icon(Icons.brightness_6),
            trailing: Switch(
              value: isDarkMode,
              onChanged: (value){
                setState(() {
                  isDarkMode=value;
                  if (value) {
                    _showFutureFeatureDialog(context); // Calls method to show alert dialog
                  }
                });
              }
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Reset Settings'),
            onTap: _resetSettings,
          ),
          const Divider(),
          ListTile(
            title: const Text ("Sign Out"),
            onTap: () =>  _showSignOutConfirmationDialog(context),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
