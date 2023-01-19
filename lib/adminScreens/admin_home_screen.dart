import 'package:ekyam/adminScreens/scheme_creation_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../firstScreen.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final newSchemeButton =Material(
      color: Colors.lightBlue,
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        splashColor: Colors.blueAccent,
        padding: EdgeInsets.fromLTRB(20, 15,20, 15),
        minWidth: MediaQuery.of(context).size.width * 0.8,
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
            const SchemeCreationScreen(),
          ),
        ),
        child: Text(
          "Create A New Scheme",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold,
          ),
        ),

      ),

    );
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Admin Homepage"),),
      ),

      //Hamburger Menu
      drawer: Drawer(

        width: MediaQuery.of(context).size.width * 0.5,
        child: ListView(
          children: <Widget>[
            TextButton(
                onPressed: (){
                  logout(context);

                },
                child: Text("Sign Out"))

          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            newSchemeButton,
          ],
        ),
      ),
    );
  }
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => FirstScreen()));
  }
}
