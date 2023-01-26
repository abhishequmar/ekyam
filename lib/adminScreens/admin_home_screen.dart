import 'package:ekyam/adminScreens/scheme_creation_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
import '../firstScreen.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ekyam",
          style: GoogleFonts.macondo(
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.black,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      //Hamburger Menu
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.6,
        child: ListTile(
          onTap: () {
            logout(context);
          },
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign Out",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const VerticalDivider(width: 10),
                const Icon(
                  Icons.exit_to_app_rounded,
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: const Icon(CupertinoIcons.plus_rectangle_on_rectangle),
        onPressed: () {
          Navigator.pushAndRemoveUntil(
              (context),
              MaterialPageRoute(
                  builder: (context) => const SchemeCreationScreen()),
              (route) => false);
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const FirstScreen()));
  }
}
