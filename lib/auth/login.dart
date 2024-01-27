// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:p1/component/drawer.dart';

import '../component/submitButtom.dart';
import '../component/textFeild.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          Text("Mercedes"),
          Text(
            "Benz",
            style: TextStyle(color: Colors.red),
          )
        ],
      )),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Form(
              key: formstate,
              child: Column(
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
                    "login",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.8),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 25),
                      child: const Text(
                        "login to continue using the app",
                        style: TextStyle(
                          letterSpacing: 2,
                        ),
                      )),
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
            ),
            CustomButton(
              title: "Login",
              onPressed: () async {
                if (formstate.currentState!.validate()) {
                  try {
                    final credential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: email.text, password: password.text);

                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.success,
                      headerAnimationLoop: true,
                      animType: AnimType.bottomSlide,
                      title: 'success',
                      reverseBtnOrder: true,
                      btnOkOnPress: () {
                        Navigator.of(context).pushReplacementNamed("homePage");
                      },
                      btnCancelOnPress: () {},
                      desc: "welcome to mercedes Benz",
                    ).show();
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'invalid-email') {
                      print("object");
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        headerAnimationLoop: true,
                        animType: AnimType.bottomSlide,
                        title: 'Eroor',
                        reverseBtnOrder: true,
                        btnOkOnPress: () {},
                        btnCancelOnPress: () {},
                        desc: "invalid Email Try again!!!!",
                      ).show();
                    } else if (e.code == 'invalid-credential') {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        headerAnimationLoop: true,
                        animType: AnimType.bottomSlide,
                        title: 'Eroor',
                        reverseBtnOrder: true,
                        btnOkOnPress: () {},
                        btnCancelOnPress: () {},
                        desc: "invalid Email or Password Try again!!!!",
                      ).show();
                    } else if (e.code == 'missing-password') {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        headerAnimationLoop: true,
                        animType: AnimType.bottomSlide,
                        title: 'Eroor',
                        reverseBtnOrder: true,
                        btnOkOnPress: () {},
                        btnCancelOnPress: () {},
                        desc: "missing-password",
                      ).show();
                    }
                    print(e);
                  }
                }
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Login with google      ",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    Image.asset(
                      "../images/glogo.png",
                      height: 30,
                    )
                  ],
                ),
                color: Color.fromARGB(255, 164, 6, 6),
                onPressed: () {},
              ),
            ),
            Container(
              height: 15,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed("signup");
              },
              child: Center(
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                    text: "Do not have an Email?  ",
                  ),
                  TextSpan(
                      text: "Register",
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
