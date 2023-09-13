import 'package:expensetracker/pages/signin.dart';
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
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Full Name",
                  hintText: "Full Name",
                  prefixIcon: Icon(Icons.perm_identity),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter secure password",
                  prefixIcon: Icon(Icons.key),
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
            ),

            SizedBox(height:15),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(color: Colors.indigo),
                ),
                SizedBox(width: 5),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder:  (BuildContext)
                      {
                        return SignIn();
                      }));
                    },

                    child: const Text('Sign In'))
              ],
            )

          ],
        ),
      ),
    );
  }
  }

