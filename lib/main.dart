import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:p1/auth/login.dart';
import 'package:p1/auth/signup.dart';
import 'package:p1/pages/EVs/update.dart';
import 'package:p1/pages/evs.dart';
import 'package:p1/pages/home.dart';
import 'package:p1/pages/categories.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:p1/product/addProduct.dart';
import 'firebase_options.dart';
import 'pages/EVs/details.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Mercedes-Benz',
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser == null ? Login() : HomePage(),
      routes: {
        'categories': (context) {
          return Categories();
        },
        'homePage': (context) {
          return HomePage();
        },
        'EVs': (context) {
          return Svs();
        },
        'signup': (context) {
          return Signup();
        },
        'login': (context) {
          return Login();
        },
        'addCar': (context) {
          return AddProduct();
        },
         'evsUpdate': (context) {
          return EvsUpdate();
        },
         'evsDetail': (context) {
          return EvsDetail();
        },
         
      },
    );
    ;
  }
}
