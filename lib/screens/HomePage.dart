import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekyam/screens/auth_screens/loginScreen.dart';
// import 'package:ekyam/screens/directLoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../widget/language_picker_widget.dart';
import '../widget/show_schemesBy_category_widget.dart';

var kprimaryTextColor = Colors.green;
var ksecondaryTextColor = Colors.black;
var ktertiaryTextColor = Colors.black;
var kprimaryFontSize = 25.0;
var ksecondaryFontSize = 20.0;
var ktertiaryFontSize = 15.0;

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
          title: const Text(
            "Schemes",
            style: TextStyle(color: Colors.green),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
          ],
          backgroundColor: const Color.fromARGB(150, 153, 210, 170),
          leading: IconButton(
            onPressed: () {},
            icon: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
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
                aspectRatio: 10 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
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
              child: Text(
                'Find Schemes By Categories',
                style: TextStyle(
                    fontSize: kprimaryFontSize,
                    fontWeight: FontWeight.bold,
                    color: ksecondaryTextColor),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Expanded(
                // padding: const EdgeInsets.all(13.0),
                child: GridView(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                  ),
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const ShowSchemesByCategory(
                                  category: "Blindness")),
                        );
                      },
                      child: const SchemeCategoryTile(category: "Blindness"),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const ShowSchemesByCategory(
                                  category: 'Hearing Impaired')),
                        );
                      },
                      child: const SchemeCategoryTile(
                          category: 'Hearing Impaired'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const ShowSchemesByCategory(
                                  category: 'Mental Disability')),
                        );
                      },
                      child: const SchemeCategoryTile(
                          category: 'Mental Disability'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const ShowSchemesByCategory(
                                  category: 'Locomotor Disability')),
                        );
                      },
                      child: const SchemeCategoryTile(
                          category: 'Locomotor Disability'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const ShowSchemesByCategory(
                                  category: 'Learning Disability')),
                        );
                      },
                      child: const SchemeCategoryTile(
                          category: 'Learning Disability'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const ShowSchemesByCategory(
                                  category: 'Physical Disability')),
                        );
                      },
                      child: const SchemeCategoryTile(
                          category: 'Physical Disability'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}

class SchemeCategoryTile extends StatelessWidget {
  const SchemeCategoryTile({Key? key, required this.category})
      : super(key: key);

  final String category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [Colors.white, Color.fromARGB(150, 153, 210, 170)],
          ),
        ),
        child: Text(
          category,
          style: TextStyle(
              fontSize: ksecondaryFontSize, color: ktertiaryTextColor),
        ),
      ),
    );
  }
}
