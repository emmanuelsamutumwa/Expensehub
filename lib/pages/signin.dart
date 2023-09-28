import 'package:expensetracker/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:expensetracker/pages/homescreen.dart';

class SignIn extends StatefulWidget {
  SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  bool isLoading = false;

  final globalkey =GlobalKey<FormState>();

 final TextEditingController emailController =TextEditingController();

 final TextEditingController passwordController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: globalkey,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(height: 250),
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
                          suffixIcon: Icon(Icons.visibility_off),
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
                      onPressed: () {
                        // Show loading indicator
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        );

                        FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        ).then((value) {
                          // Hide loading indicator
                          Navigator.pop(context);

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (BuildContext) {
                              print("Signed in successfully");
                              return HomeScreen();
                            }),
                          );
                        }).catchError((error) {
                          // Hide loading indicator
                          Navigator.pop(context);

                          String errorMessage = "An error occurred. Please try again.";
                          if (error.code == 'wrong-password') {
                            errorMessage = "Wrong password. Please try again.";
                          } else if (error.code == 'user-not-found') {
                            errorMessage = "Account does not exist. Please sign up.";
                          }

                          // Show snackbar with error message
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(errorMessage),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        });

                        final form = globalkey.currentState;
                        if (form!.validate()) {
                          print("Email: " + emailController.text.toString());
                          print("Password: " + passwordController.text.toString());
                        }
                      },
                      child: Text("Sign In"),
                    ),

                    SizedBox(height:20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Do not have an account?",
                          style: TextStyle(color: Colors.indigo),
                        ),
                        SizedBox(width:5),
                        TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext)
                              {
                                return SignUp();
                              }));
                            },
                          child: const Text("Sign Up"))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}

