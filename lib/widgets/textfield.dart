import 'package:flutter/material.dart';
import 'package:login_demo/bloc/test_bloc.dart';
import 'package:login_demo/utils/validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextFieldWidget extends StatelessWidget {
  String? labletext;
  String? hintText;
  validationKey? inputValidate;
  TextEditingController? controller;
  bool? isIconShow;
  IconButton? suffixIcon;
  int? maxline;
  int? errorMaxLines;
  TextInputType? keyboardType;
  bool? obscureText;
  TextFieldWidget(
      {this.labletext,
      this.hintText,
      this.inputValidate,
      this.controller,
      this.isIconShow,
      this.suffixIcon,
      this.maxline,
      this.errorMaxLines,
      this.keyboardType,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: keyboardType,
        maxLines: maxline,
        obscureText: obscureText!,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        validator: (input) => validateInput(input!, inputValidate!, context),
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.black,
        ),
        decoration: InputDecoration(
            errorMaxLines: errorMaxLines!,
            suffixIcon: isIconShow! ? suffixIcon : null,
            labelText: labletext,
            hintText: hintText,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
                borderSide: BorderSide(color: Colors.teal, width: 2)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
                borderSide: BorderSide(color: Colors.teal, width: 2)),
            fillColor: Colors.white,
            filled: true,
            contentPadding:
                EdgeInsets.symmetric(vertical: 5.0, horizontal: 32.0)));
  }

  String? validateInput(
    String inputValue,
    validationKey key,
    BuildContext context,
  ) {
    switch (key) {
      case validationKey.email:
        if (inputValue.isEmpty) {
          context.read<TestBloc>().updateEmail(false);
          return "Enter email";
        } else if (inputValue.isValidEmail()) {
          context.read<TestBloc>().updateEmail(true);
          return null;
        } else {
          context.read<TestBloc>().updateEmail(false);
          return "Invalid email";
        }

      case validationKey.password:
        if (inputValue.isEmpty) {
          context.read<TestBloc>().updatePassword(false);
          return "Enter password";
        } else if (inputValue.length < 8) {
          context.read<TestBloc>().updatePassword(false);
          return "Must be at least 8 characters in length";
        } else if (inputValue.length > 20) {
          context.read<TestBloc>().updatePassword(false);
          return "Must be less than 20 characters in length";
        } else if (inputValue.isValidPassword()) {
          context.read<TestBloc>().updatePassword(true);
          return null;
        } else {
          context.read<TestBloc>().updatePassword(false);
          return "Invalid password";
        }
    }
  }
}

enum validationKey { email, password }
