import 'package:flutter/material.dart';
import 'package:expensetracker/pages/signup.dart';
import 'package:expensetracker/pages/signin.dart';

class Homepage extends StatelessWidget{
  const Homepage({super.key});
  static String id = 'home_screen';

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
                          'LOGIN',
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
                          return SignIn();
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