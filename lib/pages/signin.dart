import 'package:expensetracker/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:expensetracker/pages/homescreen.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  final globalkey =GlobalKey<FormState>();


 final TextEditingController emailController =TextEditingController();
 final TextEditingController passwordController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In"),
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
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext){
                            return homescreen();
                          }
                          ));
                          final form =globalkey.currentState;
                          if (form!.validate()){
                            print("First Name: " + emailController.text.toString());
                            print("Password: " + passwordController.text.toString());
                          }
                        },
                        child: Text("Sign In")),

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

