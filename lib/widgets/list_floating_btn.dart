import 'package:flutter/material.dart';
import 'package:modais_flutter/models/my_attr_float_btn.dart';
import 'package:modais_flutter/widgets/my_float_button.dart';

class ListFloatingBtn extends StatelessWidget {
  final List<MyAttrFloatButton> myAttributes;

  const ListFloatingBtn({
    super.key,
    required this.myAttributes,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: myAttributes.map((attr) => MyFloatButton(attr: attr)).toList(),
    );
  }
}
