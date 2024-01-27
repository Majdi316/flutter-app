// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:p1/component/submitButtom.dart';
import 'package:p1/component/textFeild.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController userName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registration")),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    "../images/Mercedes_Benz__logo--desktop.png",
                    height: 300,
                    width: 300,
                  ),
                ),
                const Text(
                  "Signup",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.8),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: const Text(
                    "User Name",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                CustomText(hinttext: "Enter Your name", myController: userName),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: const Text(
                    "Email",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                CustomText(hinttext: "Enter Your Email", myController: email),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: const Text(
                    "Password",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                CustomText(
                    hinttext: "Enter Your Password", myController: password),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  alignment: Alignment.topRight,
                  child: const Text("forget password?"),
                ),
              ],
            ),
            CustomButton(
              title: "Signup",
              onPressed: () async {
                try {
                  final credential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: email.text,
                    password: password.text,
                  );
                  Navigator.of(context).pushReplacementNamed("homePage");
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    print('The password provided is too weak.');
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      headerAnimationLoop: true,
                      animType: AnimType.bottomSlide,
                      title: 'Eroor',
                      reverseBtnOrder: true,
                      btnOkOnPress: () {},
                      btnCancelOnPress: () {},
                      desc: "The password provided is too weak.",
                    ).show();
                  } else if (e.code == 'email-already-in-use') {
                    print('The account already exists for that email.');
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      headerAnimationLoop: true,
                      animType: AnimType.bottomSlide,
                      title: 'Eroor',
                      reverseBtnOrder: true,
                      btnOkOnPress: () {},
                      btnCancelOnPress: () {},
                      desc: "The account already exists for that email.",
                    ).show();
                  }
                } catch (e) {
                  print(e);
                }
              },
            ),
            Container(
              height: 15,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("login");
              },
              child: Center(
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                    text: "have an Email?  ",
                  ),
                  TextSpan(
                      text: "Login",
                      style: TextStyle(
                        color: Color.fromARGB(255, 71, 69, 232),
                      ))
                ])),
              ),
            )
          ],
        ),
      ),
    );
  }
}
