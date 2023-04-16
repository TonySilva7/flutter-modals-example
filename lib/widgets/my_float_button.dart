import 'package:flutter/material.dart';
import 'package:modais_flutter/models/my_attr_float_btn.dart';

class MyFloatButton extends StatelessWidget {
  final MyAttrFloatButton attr;

  const MyFloatButton({
    super.key,
    required this.attr,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FloatingActionButton(
        heroTag: attr.myHeroKey,
        onPressed: () => attr.onPressed(),
        tooltip: attr.tooltip,
        child: Icon(attr.myIcon),
      ),
    );
  }
}
