import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekyam/widget/show_scheme_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/HomePage.dart';

class ShowSchemesByCategory extends StatefulWidget {
  const ShowSchemesByCategory({Key? key, required this.category})
      : super(key: key);

  final String category;

  @override
  State<ShowSchemesByCategory> createState() => _ShowSchemesByCategoryState();
}

class _ShowSchemesByCategoryState extends State<ShowSchemesByCategory> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Schemes",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: kprimaryFontSize,
            ),
          ),
        ),
      ),
      body: Center(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection(widget.category)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                return ListView.builder(
                    itemCount: streamSnapshot.data!.docs.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final DocumentSnapshot data =
                          streamSnapshot.data!.docs[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ShowSchemeDetail(
                                category: widget.category,
                                name: data['name'],
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 8),
                          child: Container(
                            height: width * 0.3,
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
                              borderRadius: BorderRadius.circular(15),
                              gradient: const LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [
                                  Colors.white,
                                  Color.fromARGB(150, 153, 210, 170)
                                ],
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  data['name'],
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: ksecondaryFontSize,
                                      color: ktertiaryTextColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            }),
      ),
    );
  }
}
