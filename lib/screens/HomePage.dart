import 'package:ekyam/screens/directLoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ekyam/screens/directLoginPage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widget/language_picker_widget.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          LanguageWidget()
        ],
        title: Title(
          color: Colors.blue,
          child: const Text("Home Page"),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(AppLocalizations.of(context)!.language),
            ElevatedButton(
              onPressed: () {
                logout(context);

              },
              child: Text("Logout ->"),
            )
          ],
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) =>  DirectLoginPage()));
  }
}
