import 'package:flutter/material.dart';

class MyFormField extends StatelessWidget {
  MyFormField({
    Key? key,
    required this.controller,
    this.keyboardType = TextInputType.emailAddress,
    this.textInputAction = TextInputAction.next,
    this.suffixIcon = const SizedBox(),
    required this.hintText,
    this.validator,
    required this.icon,
    this.obscureText = false,
    this.isError = false,
  }) : super(key: key);

  final TextEditingController controller;
  TextInputType keyboardType;
  TextInputAction textInputAction;
  Widget suffixIcon;
  final String hintText;
  String? Function(String?)? validator;
  final IconData icon;
  bool obscureText;
  bool isError;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: const TextStyle(
        fontSize: 14,
      ),
      textInputAction: textInputAction,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        icon: Padding(
          padding: EdgeInsets.only(bottom: isError ? 28 : 0),
          child: Icon(icon),
        ),
        suffixIcon: suffixIcon,
        errorStyle: const TextStyle(fontSize: 10),
        hintStyle: const TextStyle(
          fontSize: 14,
        ),
        hintText: hintText,
      ),
    );
  }
}
