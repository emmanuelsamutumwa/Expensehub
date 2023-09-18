import 'package:expensetracker/pages/signin.dart';
import 'package:flutter/material.dart';
import 'package:expensetracker/pages/homescreen.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final globalkey =GlobalKey<FormState>();

  final TextEditingController emailController =TextEditingController();
  final TextEditingController passwordController =TextEditingController();
  final TextEditingController fullnameController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up"),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey,
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: globalkey,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(height:250),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: fullnameController,
                      validator: (val){
                        if (val!.isEmpty) {
                          return "Please enter Full Name";
                        }
                      },
                      decoration: InputDecoration(
                        labelText: "Full Name",
                        hintText: "Full Name",
                        prefixIcon: Icon(Icons.perm_identity),
                        suffix: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () => fullnameController,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(width: 3)
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: (val){
                        if (val!.isEmpty) {
                          return "Please enter email address";
                        }
                      },
                      decoration: InputDecoration(
                        labelText: "Email Address",
                        hintText: "name@example.com",
                        prefixIcon: Icon(Icons.email),
                        suffix: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () => emailController,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(width: 3)
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      controller: passwordController,
                      validator: (val){
                        if (val!.isEmpty) {
                          return "Please enter Password";
                        }
                      },
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Enter secure password",
                        prefixIcon: Icon(Icons.key),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(width: 3)
                        ),
                      ),
                      textInputAction: TextInputAction.done,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext){
                            return homescreen();
                          }
                          ));
                          final form =globalkey.currentState;
                          if (form!.validate()){
                            print("First Name: " + fullnameController.text.toString());
                            print("Email: " + emailController.text.toString());
                            print("Password: " + passwordController.text.toString());
                          }
                        },
                        child: Text("Sign Up")),

                    SizedBox(height:20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.indigo),
                        ),
                        SizedBox(width:5),
                        TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext)
                              {
                                return SignIn();
                              }));
                            },
                            child: const Text("Sign In"))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )

      /*
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
      ),*/
    );
  }
  }

