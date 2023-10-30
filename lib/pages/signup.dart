import 'package:expensetracker/pages/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


  bool isLoading = false;

  final globalkey =GlobalKey<FormState>();

  final TextEditingController fullnameController =TextEditingController();

  final TextEditingController emailController =TextEditingController();

  final TextEditingController passwordController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up"),
        centerTitle: true,
          automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: globalkey,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const SizedBox(height:250),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: fullnameController,
                      validator: (val){
                        if (val!.isEmpty) {
                          return "Please enter Full Name";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Full Name",
                        hintText: "Full Name",
                        prefixIcon: const Icon(Icons.perm_identity),
                        suffix: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () => fullnameController,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(width: 3)
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: (val){
                        if (val!.isEmpty) {
                          return "Please enter email address";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Email Address",
                        hintText: "name@example.com",
                        prefixIcon: const Icon(Icons.email),
                        suffix: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () => emailController,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(width: 3)
                        ),
                      ),
                    ),

                    const SizedBox(
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
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Enter secure password",
                        prefixIcon: const Icon(Icons.key),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(width: 3)
                        ),
                      ),
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(
                      height: 20,
                    ),



                  ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true; // Set isLoading to true when button is pressed
            });
                    try {
                      await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      print("Signed Up Successfully");
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Account created successfully!'),
                          duration: Duration(seconds: 5),
                        ),
                      );
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext) {
                        return const SignIn();
                      }));
                    } catch (e) {
                      if (e is FirebaseAuthException && e.code == 'email-already-in-use') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('This email is already in use. Please choose a different email address.'),
                            duration: Duration(seconds: 5),
                          ),);
                      } else {
                        print('Error: $e');
                      }
                    } finally {
                      setState(() {
                        isLoading = false;
                      });
                    }

                    final form = globalkey.currentState;
                    if (form!.validate()) {
                      print("First Name: ${fullnameController.text}");
                      print("Email: ${emailController.text}");
                      print("Password: ${passwordController.text}");
                    }},
                      child: isLoading
                          ? const CircularProgressIndicator()
                          : const Text("Sign Up")
                  )
,

                    const SizedBox(height:20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.indigo),
                        ),
                        const SizedBox(width:5),
                        TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext)
                              {
                                return const SignIn();
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

