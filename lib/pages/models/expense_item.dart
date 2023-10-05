import 'dart:convert';

class ExpenseItem {
  final String name;
  final double amount;
  final DateTime dateTime;
  final String category;
  final String? imagePath;
  Map<String, dynamic>? location; // New property to store location information

  ExpenseItem({
    required this.name,
    required this.amount,
    required this.dateTime,
    required this.category,
    this.imagePath,
    this.location, // Initialize location property
  });

  // Convert ExpenseItem to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'amount': amount,
      'dateTime': dateTime.toIso8601String(),
      'category': category,
      'imagePath': imagePath,
      'location': location, // Include location in JSON
    };
  }

  // Create ExpenseItem from JSON
  factory ExpenseItem.fromJson(Map<String, dynamic> map) {
    return ExpenseItem(
      name: map['name'],
      amount: map['amount'],
      dateTime: DateTime.parse(map['dateTime']),
      category: map['category'],
      imagePath: map['imagePath'],
      location: map['location'], // Assign location property
    );
  }

  // Convert ExpenseItem to JSON string
  String toJsonString() {
    return jsonEncode(toJson());
  }
}
