import 'package:flutter/material.dart';

class Homepage extends StatelessWidget{
  const Homepage({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: SafeArea(
        child: Center(
          child: Column(
            children:[
              const SizedBox(height: 50),

          //welcome message
              Text(
                'Welcome to Expense Hub',
              style: TextStyle(fontWeight: FontWeight.bold),
              ),
            SizedBox(height: 250),

            //sign in button
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                          'LOGIN ',
                        style: TextStyle(color: Colors.white),
                      )
                  ),
                ),
              )

            //register

            ],
          ),
        ),
      ),
    );
  }
}