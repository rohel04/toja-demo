import 'package:flutter/material.dart';

import '../../../../core/util/validator.dart';

class CustomTextField extends StatefulWidget {

  ValueChanged<String> onChanged;
  String? title;
  Function(String? value) validation;
  bool obscureText;
  TextInputType? keyboardType;



  CustomTextField({Key? key,required this.obscureText,required this.onChanged,required this.validation,this.title,this.keyboardType}) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(

        obscureText: widget.obscureText,
        style: TextStyle(
            fontSize: 16, color: Color(0xFF3A4667)),
        keyboardType: widget.keyboardType,
        key: ValueKey('email'),
        validator: (value) {
          return widget.validation(value);
        },
        onSaved: (value) {
          widget.onChanged(value!);
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding:
          EdgeInsets.fromLTRB(0, 20, 0, 0),
        ),
      ),
    );
  }
}
