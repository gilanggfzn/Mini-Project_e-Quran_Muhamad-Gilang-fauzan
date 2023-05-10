import 'package:flutter/material.dart';

class TextFieldCustome extends StatelessWidget {
  final Function(String)? onChanged;
  final bool isValidtextfield;
  final String errorMessage;
  final String hintText;
  final bool isObscureText;
  final Widget? suffixIconWidget;
  const TextFieldCustome({
    super.key, 
    required this.onChanged, 
    required this.isValidtextfield, 
    required this.errorMessage, 
    required this.hintText, 
    this.isObscureText = false, 
    this.suffixIconWidget,
 
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      onChanged: onChanged,
      obscureText: isObscureText,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: hintText,
        errorText: isValidtextfield ? null : errorMessage,
        suffixIcon: suffixIconWidget,
      ),
    );
  }
}