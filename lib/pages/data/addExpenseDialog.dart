import 'package:expensetracker/Geo/Geolocater.dart';
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
  final List<String> categories = ['Food', 'Transportation', 'Entertainment', 'Others'];
  String selectedCategory = 'Food';
  File? _selectedImage; // Make _selectedImage nullable

  Future<void> _pickImageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  void _addLocation() async {
    var userLocation = await LocationService().getUserLocation();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Location Added'),
        content: Text('Latitude: ${userLocation.latitude}, Longitude: ${userLocation.longitude}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Close'),
          ),
        ],
      ),
    );
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
          ElevatedButton(
            onPressed: () {
              _addLocation();
            },
            child: Text('Add Location'),
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
          onPressed: () async {
            String name = expenseController.text;
            double amount = double.parse(amountController.text);
            var userLocation = await LocationService().getUserLocation();

            ExpenseItem newExpense = ExpenseItem(
              name: name,
              amount: amount,
              dateTime: DateTime.now(),
              category: selectedCategory,
              imagePath: _selectedImage?.path,
              location: {
                'latitude': userLocation.latitude,
                'longitude': userLocation.longitude,
              },
            );
            Provider.of<ExpenseData>(context, listen: false).addNewExpense(newExpense, null);
            Navigator.pop(context);

            },
          child: Text('Save'),
        ),
      ],
    );
  }
}
