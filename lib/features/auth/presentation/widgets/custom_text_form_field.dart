import 'package:flutter/material.dart';
class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller ;
  final TextInputType textInputType;
  final String? Function(String?) validator;
  final String hintText;
  final bool obscureText ;
  const CustomTextFormField({super.key, required this.controller,
    required this.textInputType, required this.validator,required this.hintText,
    this.obscureText = false});

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      validator: validator,
      obscureText: obscureText,

      decoration:  InputDecoration(
        hintText:hintText,

        suffixStyle: TextStyle(color: Colors.orange),
        fillColor: Color(0xFFe5e5e5),
        filled: true,
        hintStyle: TextStyle(color: Color(0xFFbcb8b1)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
