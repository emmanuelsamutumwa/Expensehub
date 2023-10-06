import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expensetracker/pages/data/expense_data.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../models/expense_item.dart';

class AddExpenseDialog extends StatefulWidget {
  const AddExpenseDialog({super.key});

  @override
  _AddExpenseDialogState createState() => _AddExpenseDialogState();
}

class _AddExpenseDialogState extends State<AddExpenseDialog> {
  final TextEditingController expenseController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final List<String> categories = ['Food', 'Transportation', 'Entertainment','Medical','Utilities', 'Others'];
  String selectedCategory = 'Food';
  File? _selectedImage; // Make _selectedImage nullable

  // Function to open the camera and select an image
  Future<void> _pickImageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New Expense'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: expenseController,
            decoration: InputDecoration(labelText: 'Expense Name'),
          ),
          TextField(
            controller: amountController,
            decoration: InputDecoration(labelText: 'Amount'),
            keyboardType: TextInputType.number,
          ),
          DropdownButtonFormField(
            value: selectedCategory,
            items: categories.map((category) {
              return DropdownMenuItem(
                value: category,
                child: Text(category),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                selectedCategory = newValue.toString();
              });
            },
            decoration: InputDecoration(labelText: 'Category'),
          ),
          if (_selectedImage != null)
            Image.file(
              _selectedImage!,
              width: 100,
              height: 100,
            ),
          ElevatedButton(
            onPressed: () {
              _pickImageFromCamera();
            },
            child: Text('Select Image from Camera'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            String name = expenseController.text;
            double amount = double.parse(amountController.text);

            ExpenseItem newExpense = ExpenseItem(
              name: name,
              amount: amount,
              dateTime: DateTime.now(),
              category: selectedCategory,
              imagePath: _selectedImage?.path, // Pass the selected image to the ExpenseItem
            );

            Provider.of<ExpenseData>(context, listen: false).addNewExpense(newExpense);

            Navigator.pop(context);
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}

