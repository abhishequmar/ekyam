import 'package:flutter/material.dart';

import 'LoginPage.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Title(color: Colors.blue,child: Text("Signup Page"),),),
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
                    return LoginPage();
                  }
              ),
            );
          }, child: Text("Create Account")),
        ],
      ),
    );;
  }
}
