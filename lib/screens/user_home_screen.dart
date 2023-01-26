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
import '../widget/show_schemesBy_category_widget.dart';

var kprimaryTextColor = Colors.green;
var ksecondaryTextColor = Colors.black;
var ktertiaryTextColor = Colors.black;
var kprimaryFontSize = 25.0;
var ksecondaryFontSize = 18.0;
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 200,
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
            ),
            Text(
              'Find Schemes By Categories',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: kprimaryFontSize,
                    fontWeight: FontWeight.w500,
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
        MaterialPageRoute(builder: (context) => const FirstScreen()));
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
          boxShadow: [
            const BoxShadow(
              color: Colors.white,
              offset: Offset(-2, -2),
              spreadRadius: 5,
              blurRadius: 10,
            ),
            BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(2, 2),
              spreadRadius: 5,
              blurRadius: 10,
            ),
          ],
          borderRadius: BorderRadius.circular(30),
          color: Colors.green[100],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/$category.png"),
              const Divider(height: 10),
              Text(
                category,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: ksecondaryFontSize,
                    color: ktertiaryTextColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
