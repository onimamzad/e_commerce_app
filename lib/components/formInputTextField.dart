import 'package:flutter/material.dart';

class FormInputField extends StatelessWidget {

  FormInputField({this.isObscure ,this.validatorFunction, @required this.editingController,@required this.hint,@required this.fieldIcon, this.boardType});

  bool isObscure;
  final TextEditingController editingController;
  final String hint ;
  final IconData fieldIcon;
  final TextInputType boardType;
  final Function validatorFunction;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.only(left:12.0),
          child: TextFormField(
            obscureText: isObscure==null ?isObscure=false:isObscure=isObscure ,
            decoration: InputDecoration(
              labelText: hint,
              border: InputBorder.none,
              icon: Icon(fieldIcon),
            ),
            keyboardType:boardType,
            controller: editingController,
            validator: validatorFunction,
          ),
        ),
      ),
    );
  }
}