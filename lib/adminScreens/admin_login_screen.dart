import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekyam/adminScreens/scheme_creation_screen.dart';
import 'package:ekyam/models/admin_model.dart';
import 'package:ekyam/screens/auth_screens/forgotPasswordScreen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
import '../firstScreen.dart';
import 'admin_home_screen.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({Key? key}) : super(key: key);

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  final _auth = FirebaseAuth.instance;
  final _adminLoginformkey = GlobalKey<FormState>();
  AdminModel adminModel = AdminModel();

  //editingcontrollers
  final TextEditingController adminEmailController = TextEditingController();
  final TextEditingController adminPasswordController = TextEditingController();

  @override
  void initState() {
    FirebaseFirestore.instance.collection('admins').doc('admins').get().then(
      (value) {
        adminModel = AdminModel.fromMap(value.data());
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    final emailField = TextFormField(
      autofocus: false,
      controller: adminEmailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter Your Email.";
        }
        //reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter Valid Email");
        }
        //reg expression for validation of domain
        // if (!RegExp("\b*.com\$", caseSensitive: true).hasMatch(value)) {
        //   return ("Enter Valid Email");
        // }
        return null;
      },
      onSaved: (value) {
        _adminLoginformkey.currentState!.validate();
        adminEmailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      cursorColor: Colors.green,
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: GoogleFonts.poppins(
          textStyle: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        prefixIcon:
            const Icon(CupertinoIcons.mail_solid, color: Color(0xFF023047)),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        hintStyle:
            GoogleFonts.poppins(textStyle: const TextStyle(color: Colors.grey)),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
    );
    final passwordField = TextFormField(
      autofocus: false,
      controller: adminPasswordController,
      obscureText: true,
      validator: (value) {
        RegExp regex = RegExp(r'^.{8,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Please enter valid password.");
        }
        return null;
      },
      onSaved: (value) {
        _adminLoginformkey.currentState!.validate();
        adminPasswordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      cursorColor: Colors.green,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: GoogleFonts.poppins(
          textStyle: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        prefixIcon:
            const Icon(CupertinoIcons.lock_fill, color: Color(0xFF023047)),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        hintStyle:
            GoogleFonts.poppins(textStyle: const TextStyle(color: Colors.grey)),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
    );
    final adminLoginButton = MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      elevation: 10,
      minWidth: MediaQuery.of(context).size.width,
      height: 60,
      color: Colors.green,
      splashColor: kPrimaryButtonColor,
      onPressed: () {
        logIn(adminEmailController.text, adminPasswordController.text);
      },
      child: Text(
        "Login as an Admin",
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Form(
              key: _adminLoginformkey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 140, bottom: 80),
                      child: Text(
                        "Admin Login",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    emailField,
                    const SizedBox(height: 10),
                    passwordField,
                    const SizedBox(height: 40),
                    SizedBox(
                      height: 10,
                    ),
                    adminLoginButton,
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      child: Text("Forgot Password?",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.green,
                            ),
                          )),
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ForgotPasswordScreen(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //login function
  void logIn(String email, String password) async {
    if (_adminLoginformkey.currentState!.validate()) {
      if (adminModel.adminList!.contains(email)) {
        if (adminModel.adminDetails![email] == password) {
          Fluttertoast.showToast(msg: "Login Successful 😊");
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const AdminHomeScreen(),
            ),
          );
        } else {
          Fluttertoast.showToast(msg: "Invalid Password 😭");
        }
      } else {
        Fluttertoast.showToast(msg: "Invalid email 😭");
      }
    }
  }
}
