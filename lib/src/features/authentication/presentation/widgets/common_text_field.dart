import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';

class CommonTextFormField extends StatelessWidget {
  const CommonTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
    this.errorText,
  });
  final TextEditingController controller;
  final String hintText;
  final Function(String value) onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      onTapOutside: ((event) => FocusManager.instance.primaryFocus?.unfocus()),
      decoration: InputDecoration(
        errorText: errorText,
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        fillColor: Pellet.kWhite,
        filled: true,
      ),
    );
  }
}
