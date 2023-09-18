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
              style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 25),
              ),
            const SizedBox(height: 250),

            //sign in button
              Container(
                width: 250,
                height: 50,
                decoration:
                BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white12,
                ),
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            color: Colors.transparent
                        )
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext) {
                        return SignIn();
                      }));
                    },
                    child: const Text("SIGN IN")
                ),
              ),
            SizedBox(height:30),

            //register
              Container(
                width: 250,
                height: 50,
                decoration:
                BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white12,
                ),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: Colors.transparent
                    )
                  ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext) {
                        return SignUp();
                      }));
                    },
                    child: const Text("SIGN UP")
                ),
              ),
              SizedBox(height:300),

              Text("Designed By Emmanuel & Bupe")
            ]
          ),
        ),
      ),
    );
  }
}