import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

InputDecoration textFieldInputDecoration(
    {required String hintText, bool isObscure = false}) {
  return InputDecoration(
    hintText: hintText,
    // contentPadding: EdgeInsets.symmetric(vertical: 10),
    hintStyle: const TextStyle(color: Colors.white),
    border: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 3.0),
    ),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 1.5),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 3.0),
    ),
    suffixIcon: (hintText == "Password") || (hintText == "Confirm Password")
        ? isObscure
            ? const Icon(
                FontAwesomeIcons.lockOpen,
                color: Colors.white,
                size: 19,
              )
            : const Icon(
                FontAwesomeIcons.lock,
                color: Colors.white,
                size: 19,
              )
        : null,
  );
}
