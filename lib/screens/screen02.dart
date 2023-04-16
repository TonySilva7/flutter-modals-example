import 'package:flutter/material.dart';

class Screen02 extends StatefulWidget {
  final String title;
  const Screen02({super.key, required this.title});

  @override
  State<Screen02> createState() => _Screen02State();
}

class _Screen02State extends State<Screen02> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.8),
      ),
      child: Text(widget.title),
    );
  }
}
