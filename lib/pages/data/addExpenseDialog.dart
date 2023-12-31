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
  final List<String> categories = ['Food', 'Transportation', 'Entertainment','Medical','Utilities', 'Others'];
  String selectedCategory = 'Food';
  File? _selectedImage; // Make _selectedImage nullable
  var userLocation;

  //Function to retrive user location and store it in userLocation
  void _addLocation() async {
    userLocation = await LocationService().getUserLocation();
    setState(() {});
  }

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
      title: const Text('Add New Expense'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: expenseController,
              decoration: const InputDecoration(labelText: 'Expense Name'),
            ),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(labelText: 'Amount'),
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
              decoration: const InputDecoration(labelText: 'Category'),
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
              child: const Text('Select Image from Camera'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
            onPressed:(){
              _addLocation(); // Call the function to retrieve the user's location
            } ,
            child: const Text("Get users Location"),
        ),
        if (userLocation != null)
          Container(
            child: Column(
              children: [
                Text ('Latitude: ${userLocation.latitude}, Longitude: ${userLocation.longitude}'),
              ],
            ),
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
          child: const Text('Save'),
        ),
      ],
    );
  }
}

