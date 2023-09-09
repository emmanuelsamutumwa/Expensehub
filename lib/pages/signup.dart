import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up"),
      ),
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Full Name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // Add your sign-up logic here
                print('Signed Up');
              },
              child: Text("Sign Up"),
              style: TextButton.styleFrom(
                foregroundColor: Colors.teal,
                backgroundColor: Colors.white,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                elevation: 5,
              ),
            )
          ],
        ),
      ),
    );
  }
  }

