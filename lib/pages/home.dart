import 'package:flutter/material.dart';

class Homepage extends StatelessWidget{
  const Homepage({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SafeArea(
        child: Center(
          child: Column(
            children:[
              const SizedBox(height: 50),

              //logo
              const Icon(
                  Icons.money,
                size: 100,
              ),

            //welcome
            Text(
                'Welcome',
            style: TextStyle(
                color: Colors.cyan,
              fontSize: 16,
            ),
            ),
            const SizedBox(height: 25),

            //username textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)
                  )
                ),
              ),
            ),
            const SizedBox(height: 10),
            //password textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)
                      )
                  ),
                ),
              ),
            const SizedBox(height:10),

            //forgot password
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Forgot password',
                      style: TextStyle(color: Colors.grey),

                    ),
                  ],
                ),
              ),

            SizedBox(height:25),

            //sign in button
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Sign in',
                style: TextStyle(color: Colors.white),),
              ),

            const SizedBox(height:25),

            //continue with google

            //register
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Text('Not a member?'),
                    const SizedBox(width: 7),
                    Text('Sign up now',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}