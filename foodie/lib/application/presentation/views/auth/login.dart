import 'package:flutter/material.dart';
import 'package:foodie/application/data/logic/user/user_bloc.dart';
import '../../../utils/color.dart';
import '../home/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 20),
                _buildTextField("Enter Your Email", Icon(Icons.mail), _email),
                SizedBox(height: 20),
                _buildTextField(
                    "Enter Your Phone", Icon(Icons.password), _password),
                SizedBox(height: 20),
                BlocConsumer<UserBloc, UserState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        if (formKey.currentState?.validate() ?? false) {
                          BlocProvider.of<UserBloc>(context).add(SignInEvent(
                            email: _email.text,
                            password: _password.text,
                          ));
                        }
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(child: Text("Sign Up")),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("Don't Have an Account?"),
                  SizedBox(width: 3),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: AppColors.primaryColor),
                      ))
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(height: 2, width: 100, color: Colors.black),
                    Text("or"),
                    Container(height: 2, width: 100, color: Colors.black),
                  ],
                ),
                SizedBox(height: 20),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    height: 50,
                    width: 50,
                    // child: Text("G",
                    //     style: TextStyle(
                    //         fontSize: 35, fontWeight: FontWeight.w900)),
                    child: Image.asset("images/google_icon.png"),
                  ),
                  // Container(
                  //   height: 50,
                  //   width: 50,
                  //   child: Text("Git",
                  //       style: TextStyle(
                  //           fontSize: 35, fontWeight: FontWeight.w900)),
                  //   // child: Image.asset("images/google_icon.png"),
                  // )
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String hintText, Icon icon, TextEditingController controls) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 224, 172, 168),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        controller: controls,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: icon,
          contentPadding: EdgeInsets.symmetric(horizontal: 8),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
