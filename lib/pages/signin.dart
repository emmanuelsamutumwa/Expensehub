import 'package:expensetracker/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:expensetracker/pages/homescreen.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  final emailController =TextEditingController();
  final passwordController =TextEditingController();
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
              padding: EdgeInsets.all(20.0),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "name@example.com",
                  prefixIcon: Icon(Icons.email),
                  suffix: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () =>emailController.clear(),
                  ),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter secure password",
                  prefixIcon: Icon(Icons.key),
                  border: OutlineInputBorder(),
                ),
                textInputAction: TextInputAction.done,
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext) {
                    return homescreen();
                  }));

                },
                child: Text("Sign In"),
            style: TextButton.styleFrom(
              foregroundColor: Colors.teal,
              backgroundColor: Colors.white,
              shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
              elevation: 5,
            ),
            ),
            SizedBox(height:15),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Dont have an Account?',
                  style: TextStyle(color: Colors.indigo),
                ),
                SizedBox(width: 5),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder:  (BuildContext)
                      {
                        return SignUp();
                      }));
                      },

                    child: const Text('Sign Up'))
              ],
            )


          ],
        ),
      ),
    );
  }
}
