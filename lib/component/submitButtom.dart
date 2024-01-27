// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const CustomButton({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: MaterialButton(
        hoverColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        height: 45,
        child: Text(
          title,
          style: TextStyle(fontSize: 18),
        ),
        color: Color.fromARGB(255, 18, 90, 149),
        onPressed:onPressed,
      ),
    );
  }
}
