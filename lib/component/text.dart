import 'package:flutter/widgets.dart';

class Ctext extends StatefulWidget {
  final String hinttext;
  const Ctext({super.key, required this.hinttext});

  @override
  State<Ctext> createState() => _CtextState();
}

class _CtextState extends State<Ctext> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Text(
      "${widget.hinttext}",
      style: TextStyle(fontSize: 18),
    );
  }
}
