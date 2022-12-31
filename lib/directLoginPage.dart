import 'package:ekyam/HomePage.dart';
import 'package:ekyam/LoginPage.dart';
import 'package:ekyam/SignupPage.dart';
import 'package:flutter/material.dart';

class directLoginPage extends StatefulWidget {
  const directLoginPage({Key? key}) : super(key: key);

  @override
  State<directLoginPage> createState() => _directLoginPageState();
}

class _directLoginPageState extends State<directLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context){
                      return HomePage();
                    }
                ),
              );
            }, child: Text("Login Using Google Account")),
            SizedBox(height: 10),
            TextButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context){
                      return SignupPage();
                    }
                ),
              );
            }, child: Text("Signup")),
            SizedBox(height: 10),
            TextButton(onPressed:(){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context){
                      return LoginPage();
                    }
                ),
              );
            },child: Text("Login Using email"))
          ],
        ),
      ),
    );
  }
}
