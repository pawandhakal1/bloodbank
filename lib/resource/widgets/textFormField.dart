import 'package:flutter/material.dart';

class customTextFormField extends StatelessWidget {
  customTextFormField({
    Key? key,
    this.controller,
    this.keyboardType,
    this.isObscureText,
    required this.hintText,
    required this.labelText,
    required this.textInputAction,
    this.suffix,
    this.prefix,
    this.height,
    this.validator,
  }) : super(key: key);
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? isObscureText;
  final String hintText;
  final String labelText;
  final TextInputAction textInputAction;
  final Widget? suffix;
  final Widget? prefix;
  final double? height;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        height: height,
      ),
      validator: validator,
      controller: controller,
      obscureText: isObscureText!,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          )
        ),
        labelText: labelText??'',
        hintText: hintText??'',
        suffixIcon: suffix,
        prefixIcon: prefix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        )
      ),
    );
  }
}
