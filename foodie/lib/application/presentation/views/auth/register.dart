import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodie/application/data/logic/user/user_bloc.dart';
import '../home/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _phone.dispose();
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
                _buildTextField(
                  "Enter Your Name",
                  Icon(Icons.person),
                  _name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                _buildTextField(
                  "Enter Your Email",
                  Icon(Icons.mail),
                  _email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                _buildTextField(
                  "Enter Your Phone",
                  Icon(Icons.phone),
                  _phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                _buildTextField(
                  "Password",
                  Icon(Icons.password),
                  _password,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                BlocConsumer<UserBloc, UserState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        if (formKey.currentState?.validate() ?? false) {
                          BlocProvider.of<UserBloc>(context).add(SignUpEvent(
                            name: _name.text,
                            email: _email.text,
                            phone: _phone.text,
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String hintText,
    Icon icon,
    TextEditingController controller, {
    FormFieldValidator<String>? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 224, 172, 168),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: icon,
          contentPadding: EdgeInsets.symmetric(horizontal: 8),
          border: InputBorder.none,
        ),
        validator: validator,
      ),
    );
  }
}
