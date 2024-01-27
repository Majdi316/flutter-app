import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String hinttext;
  final TextEditingController myController;
  const CustomText(
      {super.key, required this.hinttext, required this.myController});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: TextFormField(
        controller: myController,
        decoration: InputDecoration(
            hintText: hinttext,
            contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
            filled: true,
            fillColor: Color.fromARGB(99, 207, 198, 198),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
      ),
    );
  }
}
