import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule_app_fe/core/api/apiUtil.dart';

class TextFieldC extends StatefulWidget {
  TextEditingController controller;
  String? label;
  bool isPassword;
  String error;
  TextFieldC(
      {super.key,
      required this.controller,
      this.error = '',
      this.label = '',
      this.isPassword = false});

  @override
  State<TextFieldC> createState() => _TextFieldCState();
}

class _TextFieldCState extends State<TextFieldC> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: widget.controller,
          obscureText: widget.isPassword,
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            labelText: widget.label,
          ),
        ),
        widget.error != ''
            ? const SizedBox(height: 10)
            : const SizedBox.shrink(),
        widget.error != ''
            ? Align(
                alignment: Alignment.topLeft,
                child: Text(
                  widget.error,
                  style: const TextStyle(color: Colors.red),
                ),
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
