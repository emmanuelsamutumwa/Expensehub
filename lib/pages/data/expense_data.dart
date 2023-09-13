import 'package:expensetracker/datetime/date_time_helper.dart';
import 'package:expensetracker/pages/models/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseData extends ChangeNotifier{

  // list of all expenses
  List<ExpenseItem> overallExpenseList =[];

  //get expense list
  List<ExpenseItem> getAllExpenseList() {
    return overallExpenseList;
  }
  //add new expenses method
  void addNewExpense (ExpenseItem newExpense) {
    overallExpenseList.add (newExpense);
    notifyListeners();
  }
  //delete expense method
  void deleteExpense (ExpenseItem expense) {
    overallExpenseList.remove(expense);
    notifyListeners();
  }
  //get week day from dateTime object
  String getDayName (DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thur';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }
  //get the date for the start of the week (sunday)
  DateTime startOfWeekDate() {
    DateTime? startOfWeek;

    //get todays date
    DateTime today = DateTime.now();

    //go backward from today to find sunday
    for (int i =0; i<7; i++) {
      if (getDayName(today.subtract(Duration(days: i))) == 'Sun') {
          startOfWeek = today.subtract(Duration(days: i));
      }
    }
    return startOfWeek!;
  }


  /*

  convert overall list of expense into daily expense summary

  eg
  overallExpenseList =

  [
  [food, 2023/14/05, K20],
  [music, 2023/15/05, K100]
  ]
  ->
  DailyExpenseSummary =
  [2023/02/14: K200],
  [2023/05/14:K2000]
  ]


   */
  Map<String,double> calculateDailyExpenseSummary () {
    Map<String, double> dailyExpenseSummary ={
      //date (yyyymmdd) : amountTotalForDay
    };
    for (var expense in overallExpenseList) {
      String date = convertDateTimeToString(expense.dateTime);
      double amount =double.parse(expense.amount);

      if (dailyExpenseSummary.containsKey(date)) {
        double currentAmount = dailyExpenseSummary [date] !;
        currentAmount += amount;
        dailyExpenseSummary [date] = currentAmount;
      }else{
        dailyExpenseSummary.addAll({date:amount});
      }
    }

    return dailyExpenseSummary;
  }
}