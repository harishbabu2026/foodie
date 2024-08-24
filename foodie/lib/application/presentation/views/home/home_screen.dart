import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(leading: Icon(Icons.person), title: Text("Home Screen")),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                    height: 300,
                    width: 500,
                    child: Image.asset("images/success.png")),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Category",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))
            ]),
          ),
        ));
  }
}
