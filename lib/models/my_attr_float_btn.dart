import 'package:flutter/material.dart';

class MyAttrFloatButton {
  final ObjectKey myHeroKey;
  final VoidCallback onPressed;
  final String tooltip;
  final IconData myIcon;
  final String titleButton;

  const MyAttrFloatButton({
    required this.myHeroKey,
    required this.onPressed,
    required this.tooltip,
    required this.myIcon,
    required this.titleButton,
  });
}
