import 'package:flutter/foundation.dart';
import 'package:expensetracker/pages/models/expense_item.dart';

class ExpenseData extends ChangeNotifier {
  List<ExpenseItem> _expenses = [];
  String _selectedCurrency = 'USD'; // Default currency value

  List<ExpenseItem> get expenses => _expenses;
  String get selectedCurrency => _selectedCurrency;

  void addNewExpense(ExpenseItem expense) {
    _expenses.add(expense);
    notifyListeners();
  }

  void removeExpense(int index) {
    _expenses.removeAt(index);
    notifyListeners();
  }

  void updateCurrency(String newCurrency) {
    _selectedCurrency = newCurrency;
    notifyListeners();
  }
}
