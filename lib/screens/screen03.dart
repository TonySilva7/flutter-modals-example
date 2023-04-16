import 'package:flutter/material.dart';

class Screen03 extends StatefulWidget {
  final String title;
  const Screen03({super.key, required this.title});

  @override
  State<Screen03> createState() => _Screen02State();
}

class _Screen02State extends State<Screen03> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.cyan.withOpacity(0.8),
      ),
      child: Text(widget.title),
    );
  }
}
