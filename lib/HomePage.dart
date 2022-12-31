import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Title(color: Colors.blue,child: Text("Home Page"),),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("THIS IS HOME PAGE")
        ],
      ),
    );
  }
}
