import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  const MyButton({super.key});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton
    (
      child: Icon(Icons.home),
      onPressed: (){
      Navigator.of(context).pushNamed("homePage");
      
    });
  }
}