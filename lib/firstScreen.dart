import 'package:ekyam/adminScreens/admin_login_screen.dart';
import 'package:ekyam/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/auth_screens/userLoginScreen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    final userLoginButton = MaterialButton(
      elevation: 20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      color: Colors.white,
      splashColor: kPrimaryButtonColor,
      // padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      minWidth: MediaQuery.of(context).size.width * 0.6,
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const UserLoginScreen(),
        ),
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.width * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/icons8-person-94.png"),
            const SizedBox(height: 10),
            Text(
              "User",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    final adminLoginButton = MaterialButton(
      elevation: 20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      color: Colors.white,
      splashColor: kPrimaryButtonColor,
      // padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      minWidth: MediaQuery.of(context).size.width * 0.6,
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const AdminLoginScreen(),
        ),
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.width * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/icons8-administrator-male-94.png"),
            const SizedBox(height: 10),
            Text(
              "Admin",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 120),
              child: Text(
                "Ekyam",
                style: GoogleFonts.macondo(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 42,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            userLoginButton,
            Divider(
              color: Colors.grey, //color of divider
              height: 30, //height spacing of divider
              thickness: 1, //thickness of divier line
              indent: MediaQuery.of(context).size.width *
                  0.28, //spacing at the start of divider
              endIndent: MediaQuery.of(context).size.width *
                  0.28, //spacing at the end of divider
            ),
            adminLoginButton,
          ],
        ),
      ),
    );
  }
}
