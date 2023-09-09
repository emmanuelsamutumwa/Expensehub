import 'package:flutter/material.dart';
import 'package:expensetracker/pages/signup.dart';
import 'package:expensetracker/pages/signin.dart';

class Homepage extends StatelessWidget{
  const Homepage({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,
      body: SafeArea(
        child: Center(
          child: Column(
            children:<Widget>[
              const SizedBox(height: 50),

          //welcome message
              const Text(
                'Welcome to Expense Hub',
              style: TextStyle(fontWeight: FontWeight.bold),
              ),
            SizedBox(height: 250),

            //sign in button
              Container(
                height: 20,
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext) {
                          return SignIn();
                        }));
                      },
                      child: Text(
                          'SIGN IN',
                        style: TextStyle(color: Colors.white),
                      )
                  ),
                ),
              ),
            SizedBox(height:10),

            //register
              Container(
                height: 20,
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext) {
                          return SignUp();
                        }));
                      },
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(color: Colors.white),
                      )
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}