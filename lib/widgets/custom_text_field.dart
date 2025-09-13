import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({super.key, required this.hintText, this.onChange, this.obscureText = false});

  final String hintText;
  Function(String)? onChange;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:obscureText! ,
      validator:(data){
        if(data!.isEmpty){
          return 'this field is required';
        }
      },
      onChanged: onChange,

      decoration: InputDecoration(
prefixIcon: Icon(Icons.search),
        suffixIcon: Icon(Icons.tune),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(6)
        ),
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(6)),
      ),
    );
  }
}
