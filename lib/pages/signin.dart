import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  final emailController =TextEditingController();
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
                  print ('Signed In');
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
                Text(
                  'Sign Up',
                  style: TextStyle(color:Colors.blue ),

                ),
              ],
            )


          ],
        ),
      ),
    );
  }
}
