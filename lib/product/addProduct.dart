// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:p1/component/submitButtom.dart';
import 'package:p1/component/textFeild.dart';

import '../component/text.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController carName = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController image = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController Acceleration = TextEditingController();
  TextEditingController Torque = TextEditingController();
  TextEditingController Power = TextEditingController();
  String dropVal = "evs";
  CollectionReference evs = FirebaseFirestore.instance.collection('products');

  var counter = Random().nextDouble() * 10;

  Future<void> addCars() {
    // Call the user's CollectionReference to add a new user
    return evs
        .add({
          "Power": Power.text,
          "Torque": Torque.text,
          "Acceleration": Acceleration.text,
          "category": dropVal,
          "Car name": carName.text,
          "image": image.text,
          "price": price.text,
          "id": FirebaseAuth.instance.currentUser!.uid,
          "uid": counter
        })
        .then((value) => AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              headerAnimationLoop: true,
              animType: AnimType.bottomSlide,
              title: 'success',
              reverseBtnOrder: true,
              btnOkOnPress: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("homePage", (route) => false);
              },
              btnCancelOnPress: () {},
              desc: "car is added",
            ).show())
        .catchError((error) => AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              headerAnimationLoop: true,
              animType: AnimType.bottomSlide,
              title: 'Error',
              reverseBtnOrder: true,
              btnOkOnPress: () {},
              btnCancelOnPress: () {},
              desc: "failed add car ${error}",
            ).show());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("add new car"),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //felid 1
                Ctext(
                  hinttext: "Car name",
                ),
                CustomText(hinttext: "Car name", myController: carName),
                //felid 2
                Ctext(
                  hinttext: "category",
                ),
                DropdownButton(
                  value: dropVal,
                  onChanged: (value) {
                    setState(() {
                      dropVal = value.toString();
                    });
                  },
                  items: [
                    DropdownMenuItem(
                      value: "evs",
                      child: Text("evs"),
                    ),
                    DropdownMenuItem(
                      value: "suv",
                      child: Text("suv"),
                    ),
                    DropdownMenuItem(
                      value: "Sedans & Wagons",
                      child: Text("Sedans & Wagons"),
                    ),
                    DropdownMenuItem(
                      value: "Coupes",
                      child: Text("Coupes"),
                    ),
                    DropdownMenuItem(
                      value: "Convertibles & Roadsters",
                      child: Text("Convertibles & Roadsters"),
                    ),
                  ],
                ),
                //felid 3
                Ctext(
                  hinttext: "image",
                ),
                CustomText(hinttext: "image url", myController: image),
                //felid 4
                Ctext(
                  hinttext: "price",
                ),
                CustomText(hinttext: "price", myController: price),
                //felid 5
                Ctext(
                  hinttext: "Acceleration",
                ),
                CustomText(
                    hinttext: "Acceleration", myController: Acceleration),
                //felid 6
                Ctext(
                  hinttext: "Torque",
                ),
                CustomText(hinttext: "Torque", myController: Torque),
                //felid 7
                Ctext(
                  hinttext: "Power",
                ),
                CustomText(hinttext: "Power", myController: Power),
              ],
            ),
          ),
          CustomButton(
            title: "submit",
            onPressed: () {
              addCars();
            },
          ),
        ],
      ),
    );
  }
}
