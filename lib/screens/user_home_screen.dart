import 'package:carousel_slider/carousel_slider.dart';
import 'package:ekyam/firstScreen.dart';
// import 'package:ekyam/screens/auth_screens/loginScreen.dart';
// import 'package:ekyam/screens/directLoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';


import '../widget/language_picker_widget.dart';

var kprimaryTextColor = Colors.green;
var ksecondaryTextColor = Colors.black;
var ktertiaryTextColor = Colors.black;
var kprimaryFontSize = 25.0;
var ksecondaryFontSize =20.0;
var ktertiaryFontSize =15.0;

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
        elevation: 0,
        title: const Text("Schemes", style: TextStyle(color: Colors.green),),
        centerTitle: true ,
        actions :  <Widget> [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
          ),

        ],
        backgroundColor: Color.fromARGB(150, 153, 210, 170),
        leading: IconButton(
            onPressed: () {},
            icon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu)
    ),
        ),
        // shape: const RoundedRectangleBorder(
        //   borderRadius: BorderRadius.only(
        //     bottomLeft: Radius.circular(25),
        //     bottomRight: Radius.circular(25),
        //   )
        // ),
      ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CarouselSlider(
              options: CarouselOptions(
        height: 250,
          aspectRatio: 10/9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          // onPageChanged: callbackFunction,
          scrollDirection: Axis.horizontal,
        ),
              items: [
                Image.network("https://via.placeholder.com/350x150"),
                Image.network("https://via.placeholder.com/350x150"),
                Image.network("https://via.placeholder.com/350x150"),
              ],
              // autoPlay: true,
              // viewportFraction: 1.0,
              // aspectRatio: 2.0,
            ),

            Container(
              // padding: const EdgeInsets.all(13.0),
              child: Text('Find Schemes By Categories',
                style: TextStyle(fontSize: kprimaryFontSize, fontWeight: FontWeight.bold,color: ksecondaryTextColor),),
            ),
            SizedBox(height: 20,),
            Container(
              child: Expanded(
                // padding: const EdgeInsets.all(13.0),
                child: GridView(
                  children:[


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(child: Text('Blindness',

                      style: TextStyle(fontSize: ksecondaryFontSize,color: ktertiaryTextColor),),
                      decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [Colors.white, Color.fromARGB(150, 153, 210, 170)],
                      ),
                    ),

                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(child: Text('Mental Disability',
                      style: TextStyle(fontSize: ksecondaryFontSize,color: ktertiaryTextColor),),
                      decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [Colors.white, Color.fromARGB(150, 153, 210, 170)],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(child: Text('Hearing Impaired',
                      style: TextStyle(fontSize: ksecondaryFontSize,color: ktertiaryTextColor),),
                      decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [Colors.white, Color.fromARGB(150, 153, 210, 170)],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(child: Text('Locomotor Disability',
                      style: TextStyle(fontSize: ksecondaryFontSize,color: ktertiaryTextColor),),
                      decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [Colors.white, Color.fromARGB(150, 153, 210, 170)],
                        ),
                      ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(child: Text('Learning Disability',
                      style: TextStyle(fontSize: ksecondaryFontSize,color: ktertiaryTextColor),),
                      decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [Colors.white, Color.fromARGB(150, 153, 210, 170)],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Text('Physical Disability',
                        style: TextStyle(fontSize: ksecondaryFontSize,color: ktertiaryTextColor),),decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [Colors.white, Color.fromARGB(150, 153, 210, 170)],
                      ),
                    ),
                    ),
                  ),
                ],
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 20,),

                ),
              ),
            ),
          ],
        )
      );

  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => FirstScreen()));
  }
}
