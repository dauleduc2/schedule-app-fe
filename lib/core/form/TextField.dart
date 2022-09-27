import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule_app_fe/core/providers/api.provider.dart';

class TextFieldC extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final bool isPassword;
  final String error;
  final String name;
  const TextFieldC(
      {super.key,
      required this.controller,
      this.error = '',
      this.label = '',
      this.name = '',
      this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return Consumer<ApiProvider>(
      builder: (context, value, child) {
        final String error = value.errorDetails[name] ?? '';
        return Column(
          children: [
            TextField(
              controller: controller,
              obscureText: isPassword,
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                labelText: label,
              ),
            ),
            error != '' ? const SizedBox(height: 10) : const SizedBox.shrink(),
            error != ''
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
