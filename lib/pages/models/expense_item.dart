import 'dart:io';

class ExpenseItem {
  final String name;
  final double amount;
  final DateTime dateTime;
  final String category;
  final File? image;

  ExpenseItem({
    required this.name,
    required this.amount,
    required this.dateTime,
    required this.category,
    this.image,
  });
}
