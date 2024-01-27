import 'package:flutter/material.dart';

class detailText extends StatefulWidget {
  final String title;
  const detailText({super.key, required this.title});

  @override
  State<detailText> createState() => _detailTextState();
}

class _detailTextState extends State<detailText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      '${widget.title}',
      style: TextStyle(fontSize: 20),
    );
  }
}
