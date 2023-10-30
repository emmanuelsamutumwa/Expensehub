import 'dart:convert';

class ExpenseItem {
  final String name;
  final double amount;
  final DateTime dateTime;
  final String category;
  final String? imagePath;

  ExpenseItem({
    required this.name,
    required this.amount,
    required this.dateTime,
    required this.category,
    this.imagePath,
  });

  // Convert ExpenseItem to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'amount': amount,
      'dateTime': dateTime.toIso8601String(),
      'category': category,
      'imagePath': imagePath,
    };
  }

  // Create ExpenseItem from JSON
  factory ExpenseItem.fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    return ExpenseItem(
      name: map['name'],
      amount: map['amount'],
      dateTime: DateTime.parse(map['dateTime']),
      category: map['category'],
      imagePath: map['imagePath'],
    );
  }

  // Convert ExpenseItem to JSON string
  String toJsonString() {
    return jsonEncode(toJson());
  }
}
