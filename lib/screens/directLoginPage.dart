// import 'package:ekyam/screens/HomePage.dart';
// import 'package:ekyam/screens/auth_screens/loginScreen.dart';
// import 'package:ekyam/screens/auth_screens/signupScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// final GoogleSignIn _googleSignIn = GoogleSignIn(
//   scopes: [
//     'email'
//   ]
// );
//
// class DirectLoginPage extends StatefulWidget {
//
//   GoogleSignInAccount? _currentUser;
//   @override
//   initState(){
//     _googleSignIn.onCurrentUserChanged.listen((account) {
//         _currentUser = account;
//     });
//     _googleSignIn.signInSilently();
//     // super.initState();
//
//   }
//   // const DirectLoginPage({Key? key}) : super(key: key);
//
//   @override
//   State<DirectLoginPage> createState() => _DirectLoginPageState();
// }
//
// class _DirectLoginPageState extends State<DirectLoginPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextButton(
//               child: const Text("Login with Google"),
//               onPressed: () {
//                 _googleSignIn.signIn();
//                 if(GoogleSignInAccount !=null) {
//                   print(GoogleSignInAccount);
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) =>  HomePage()),
//                   );
//                 }
//
//
//                 // Navigator.push(
//                 //   (context),
//                 //   MaterialPageRoute(
//                 //     builder: (context) => const HomePage(),
//                 //   ),
//                 // );
//               },
//             ),
//             TextButton(
//               child: const Text("Sign Up with Email"),
//               onPressed: () {
//                 Navigator.push(
//                   (context),
//                   MaterialPageRoute(
//                     builder: (context) => const SignUpScreen(),
//                   ),
//                 );
//               },
//             ),
//             TextButton(
//               child: const Text("Login with Email"),
//               onPressed: () {
//                 Navigator.push(
//                   (context),
//                   MaterialPageRoute(
//                     builder: (context) => const LoginScreen(),
//                   ),
//                 );
//               },
//             ),
//             TextButton(
//               child: const Text("Sign Out"),
//               onPressed: () {
//                 _googleSignIn.signOut();
//
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
