import 'package:expensetracker/pages/statistics.dart';
import 'package:expensetracker/widget/bottomnavigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expensetracker/pages/data/expense_data.dart';
import 'homescreen.dart';

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
              items: <String>['USD', 'EUR', 'GBP', 'JPY']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          ListTile(
            title: Text('Reset Settings'),
            onTap: _resetSettings,
          ),
        ],
      ),
    );
  }
}
