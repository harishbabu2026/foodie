import 'package:flutter/material.dart';
import './login.dart';
import './register.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool states = false;

  void handleSignUp() {
    setState(() {
      states = false;
    });
  }

  void handleLogin() {
    setState(() {
      states = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(350), // Custom height
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 226, 16, 16),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
          child: AppBar(
            backgroundColor:
                Colors.transparent, // Make AppBar background transparent
            elevation: 0, // Remove shadow
            flexibleSpace: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 40),
                  Image.asset(
                    "images/Not Found.png",
                    height: 200,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: () {
                            handleLogin();
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: states ? Colors.white : Colors.black),
                          )),
                      TextButton(
                          onPressed: () {
                            handleSignUp();
                          },
                          child: Text(
                            "SignUp",
                            style: TextStyle(
                                color: !states ? Colors.white : Colors.black),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: states
            ? LoginScreen()
            : RegisterScreen(), // Add your body content here
      ),
    );
  }
}
