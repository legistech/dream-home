import 'package:flutter/material.dart';

import '../../../../theme/pellet.dart';

/// [CommonAuthTextField] is a common text field used in the authentication feature
class CommonAuthTextField extends StatelessWidget {
  const CommonAuthTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
    this.errorText,
    this.obscureText,
    required this.keyboardType,
    this.suffixIcon,
    this.prefixIcon,
  });
  final TextEditingController controller;
  final String hintText;
  final Function(String value) onChanged;
  final String? errorText;
  final bool? obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final Icon? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      onChanged: onChanged,
      onTapOutside: ((event) => FocusManager.instance.primaryFocus?.unfocus()),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        suffixIconColor: Pellet.kGrey,
        prefixIconColor: Pellet.kPrimaryColor,
        contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
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
