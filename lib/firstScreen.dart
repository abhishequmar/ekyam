import 'package:ekyam/adminScreens/admin_login_screen.dart';
import 'package:ekyam/constants.dart';
import 'package:flutter/material.dart';

import 'screens/auth_screens/userLoginScreen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    final userLoginButton = Material(
      color: kPrimaryButtonColor,
      elevation: 0,
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        elevation: 0,
        splashColor: Colors.green,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery
            .of(context)
            .size
            .width *0.80,

        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
            const UserLoginScreen(),
          ),
        ),
        child: Text(
          "Continue As A User",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold,
          ),
        ),

      ),

    );
    final adminLoginButton = Material(
      color: kPrimaryButtonColor,
      elevation: 0,
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        elevation: 0,

        splashColor: Colors.green,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery
            .of(context)
            .size
            .width * 0.8,
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
            const AdminLoginScreen(),
          ),
        ),
        child: Text(
          "Continue as An Admin",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold,
          ),
        ),

      ),

    );
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            userLoginButton,
            SizedBox(height: 30,),
            adminLoginButton,
          ],
        ),
      ),
    );
  }
}
