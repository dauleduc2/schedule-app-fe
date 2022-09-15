import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextFieldC extends StatelessWidget {
  TextEditingController controller;
  String? label;

  TextFieldC({super.key, required this.controller, this.label});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: label,
      ),
    );
  }
}
