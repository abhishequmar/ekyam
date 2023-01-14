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
        title: const Text("Schemes"),
        centerTitle: true ,
        actions :  <Widget> [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
          ),
        ],
        backgroundColor: Color(0xFFF49D1A),
        leading: IconButton(
            onPressed: () {},
            icon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu)
    ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          )
        ),
      ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: GridView(children:[
              Container(
                child: Text('Find By Categories',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.black),),
              ),
              Container(decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(5),color:Colors.white),),
              Container(child: Text('Blindness',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.black),),
                decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(15),color:Colors.orangeAccent),),
              Container(child: Text('Mental Disability',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.black),),
                decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(15),color:Colors.yellowAccent),),
              Container(child: Text('Hearing Impaired',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.black),),
                decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(15),color:Colors.pinkAccent),),
              Container(child: Text('Locomotor Disability',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.black),),
                decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(15),color:Colors.greenAccent),),
              Container(child: Text('Learning Disability',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.black),),
                decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(15),color:Colors.redAccent),),
              Container(
                child: Text('Physical Disability',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.black),),decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(15),color:Colors.blueAccent),),
            ],
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 20,),

            ),
          ),
        )
      );

  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => DirectLoginPage()));
  }
}
