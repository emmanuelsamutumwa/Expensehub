import 'package:flutter/foundation.dart';
import 'package:expensetracker/pages/models/expense_item.dart';

class ExpenseData extends ChangeNotifier {
  List<ExpenseItem> _expenses = [];

  List<ExpenseItem> get expenses => _expenses;

  void addNewExpense(ExpenseItem expense) {
    _expenses.add(expense);
    notifyListeners();
  }

  void removeExpense(int index) {
    _expenses.removeAt(index);
    notifyListeners();
  }
}
