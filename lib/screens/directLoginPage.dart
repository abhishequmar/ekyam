import 'package:ekyam/screens/HomePage.dart';
import 'package:ekyam/screens/auth_screens/loginScreen.dart';
import 'package:ekyam/screens/auth_screens/signupScreen.dart';
import 'package:flutter/material.dart';

class DirectLoginPage extends StatelessWidget {
  const DirectLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: const Text("Login with Google"),
              onPressed: () {
                Navigator.push(
                  (context),
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
            ),
            TextButton(
              child: const Text("Sign Up with Email"),
              onPressed: () {
                Navigator.push(
                  (context),
                  MaterialPageRoute(
                    builder: (context) => const SignUpScreen(),
                  ),
                );
              },
            ),
            TextButton(
              child: const Text("Login with Email"),
              onPressed: () {
                Navigator.push(
                  (context),
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
