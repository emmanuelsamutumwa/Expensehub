import 'package:flutter/material.dart';
import 'package:expensetracker/pages/signup.dart';
import 'package:expensetracker/pages/signin.dart';

class Homepage extends StatelessWidget{
  const Homepage({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            const SizedBox(height: 425),

            //sign in button
              Container(
                width: 250,
                height: 50,
                decoration:
                BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.blue,
                ),
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            color: Colors.transparent
                        )
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (buildContext) {
                        return SignIn();
                      }));
                    },
                    child: const
                    Text("SIGN IN",
                        style: TextStyle(color: Colors.white))),
              ),
            SizedBox(height:30),

            //register
              Container(
                width: 250,
                height: 50,
                decoration:
                BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.blue,
                ),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: Colors.transparent
                    )
                  ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (buildContext) {
                        return SignUp();
                      }));
                    },
                    child: const
                    Text("SIGN UP",
                    style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(height:175),

              Text("Designed By Emmanuel & Bupe")
            ]
          ),
        ),
      ),
    );
  }
}