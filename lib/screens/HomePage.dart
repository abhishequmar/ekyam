import 'package:ekyam/screens/directLoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
        actions: const [
          LanguagePickerWidget(),
          SizedBox(width: 12),
        ],
        centerTitle: true,
        title: Title(
          color: Colors.blue,
          child: Text(
            "Home Page",
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.language,
                style: GoogleFonts.poppins(fontSize: 16),
              ),
              ElevatedButton(
                onPressed: () {
                  logout(context);
                },
                child: Text(
                  "Logout ->",
                  style: GoogleFonts.poppins(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => DirectLoginPage()));
  }
}
