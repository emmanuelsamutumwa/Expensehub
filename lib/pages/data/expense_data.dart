import 'package:flutter/foundation.dart';
import 'package:expensetracker/pages/models/expense_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExpenseData extends ChangeNotifier {
  List<ExpenseItem> _expenses = [];
  String _selectedCurrency = 'USD'; // Default currency value

  ExpenseData() {
    _loadData(); // Load data when the class is instantiated
  }

  List<ExpenseItem> get expenses => _expenses;
  String get selectedCurrency => _selectedCurrency;

  void addNewExpense(ExpenseItem expense) {
    _expenses.add(expense);
    _saveData(); // Save data after adding a new expense
    notifyListeners();
  }

  void removeExpense(int index) {
    _expenses.removeAt(index);
    _saveData(); // Save data after removing an expense
    notifyListeners();
  }

  void updateCurrency(String newCurrency) {
    _selectedCurrency = newCurrency;
    _saveData(); // Save data after updating currency
    notifyListeners();
  }

  // Load data from local storage
  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? expensesData = prefs.getStringList('expenses');

    if (expensesData != null) {
      _expenses = expensesData.map((data) => ExpenseItem.fromJson(data)).toList();
      notifyListeners();
    }
  }

// Save data to local storage
  Future<void> _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> expensesData = _expenses.map((expense) => expense.toJsonString()).toList();
    prefs.setStringList('expenses', expensesData);
  }
}
