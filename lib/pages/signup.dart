import 'package:expensetracker/pages/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final globalkey =GlobalKey<FormState>();

  final TextEditingController fullnameController =TextEditingController();

  final TextEditingController emailController =TextEditingController();

  final TextEditingController passwordController =TextEditingController();

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
                          FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text) .then((value)  {
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext) {
                            print("Signed Up Successfully");
                          return SignIn();
                          }
                          ));

                          });
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
    );
  }
}

