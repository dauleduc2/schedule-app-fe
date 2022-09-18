import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule_app_fe/core/providers/api.provider.dart';

class TextFieldC extends StatefulWidget {
  TextEditingController controller;
  String? label;
  bool isPassword;
  String name;
  TextFieldC(
      {super.key,
      required this.controller,
      required this.name,
      this.label = '',
      this.isPassword = false});

  @override
  State<TextFieldC> createState() => _TextFieldCState();
}

class _TextFieldCState extends State<TextFieldC> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ApiProvider>(
      builder: (context, value, child) {
        var error = value.errorDetails[widget.name];
        print('${widget.name}: ${error}');
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
            error != null
                ? const SizedBox(height: 10)
                : const SizedBox.shrink(),
            error != null
                ? Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      error,
                      style: const TextStyle(color: Colors.red),
                    ),
                  )
                : const SizedBox.shrink()
          ],
        );
      },
    );
  }
}
