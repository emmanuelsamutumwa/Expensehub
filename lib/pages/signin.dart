import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In"),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey,
      body:  Center(
        child: Column(

          children: <Widget>[
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
                  print ('Signed In');
                },
                child: Text("Sign In"),
            style: TextButton.styleFrom(
              foregroundColor: Colors.teal,
              backgroundColor: Colors.white,
              shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
              elevation: 5,
            ),)
          ],
        ),
      ),
    );
  }
}
