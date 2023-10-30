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
                const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.blue,
                ),
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                            color: Colors.transparent
                        )
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (buildContext) {
                        return const SignIn();
                      }));
                    },
                    child: const
                    Text("SIGN IN",
                        style: TextStyle(color: Colors.white))),
              ),
            const SizedBox(height:30),

            //register
              Container(
                width: 250,
                height: 50,
                decoration:
                const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.blue,
                ),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Colors.transparent
                    )
                  ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (buildContext) {
                        return const SignUp();
                      }));
                    },
                    child: const
                    Text("SIGN UP",
                    style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height:70),

              const Text("Designed By Emmanuel & Bupe")
            ]
          ),
        ),
      ),
    );
  }
}