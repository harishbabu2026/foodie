import 'package:flutter/material.dart';
import './application/presentation/views/category/categry_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './application/data/logic/user/user_bloc.dart';

void main() async {
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDbJxKOcY_cZKiUktUW6cCo7CZt4yQQTX0",
          appId: "1:543449788828:web:0d892f7a6d3e63271dd859",
          messagingSenderId: "543449788828",
          projectId: "foodie-a0217"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CategoryScreen(),
      ),
    );
  }
}
