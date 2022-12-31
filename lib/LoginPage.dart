import 'package:ekyam/HomePage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Title(color: Colors.blue,child: Text("Login Page"),),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Enter Email" ,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Enter Password" ,
            ),
          ),
          SizedBox(height: 10),
          TextButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context){
                    return HomePage();
                  }
              ),
            );
          }, child: Text("Login")),
        ],
      ),
    );
  }
}
