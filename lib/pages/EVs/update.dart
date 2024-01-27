// ignore_for_file: prefer_const_constructors

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:p1/component/text.dart';
import 'package:p1/component/textFeild.dart';

import '../../component/submitButtom.dart';

class EvsUpdate extends StatefulWidget {
  final String? docid;
  final String? carNameo;
  
  final String? imageo;
  final String? priceo;
  final String? Accelerationo;
  final String? Torqueo;
  final String? Powero;
  const EvsUpdate(
      {super.key,
      this.docid,
      this.carNameo,
      
      this.imageo,
      this.priceo,
      this.Accelerationo,
      this.Torqueo,
      this.Powero});

  @override
  State<EvsUpdate> createState() => _EvsUpdateState();
}

class _EvsUpdateState extends State<EvsUpdate> {
  TextEditingController carName = TextEditingController();

  TextEditingController image = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController Acceleration = TextEditingController();
  TextEditingController Torque = TextEditingController();
  TextEditingController Power = TextEditingController();
  CollectionReference evs = FirebaseFirestore.instance.collection('products');
  String dropVal = "evs";

  Future<void> editCars() {
    // Call the user's CollectionReference to add a new user
    return evs
        .doc(widget.docid)
        .update({
          "Power": Power.text,
          "Torque": Torque.text,
          "Acceleration": Acceleration.text,
          
          "Car name": carName.text,
          "image": image.text,
          "price": price.text,
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
                    .pushNamedAndRemoveUntil("categories", (route) => false);
              },
              desc: "updated successfully",
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
              desc: "failed add name ${error}",
            ).show());
  }

  @override
  void initState() {
    // TODO: implement initState
    carName.text = widget.carNameo.toString();
    price.text = widget.priceo.toString();
    image.text = widget.imageo.toString();
  
    Power.text = widget.Powero.toString();
    Acceleration.text = widget.Accelerationo.toString();
    Torque.text = widget.Torqueo.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update"),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Ctext(
                  hinttext: "Car name",
                ),
                CustomText(hinttext: "Car name", myController: carName),
                
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
              editCars();
            },
          ),
        ],
      ),
    );
  }
}
