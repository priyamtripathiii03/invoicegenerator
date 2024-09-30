import 'package:flutter/material.dart';

TextField TextForCilent(
    {required String hint, required controller,
      required bool isPhone,
      required bool isAddress,
      required bool isNumber,
      required String lable,
    }) {

  return TextField(
    keyboardType: isNumber ? TextInputType.numberWithOptions() : TextInputType.text,
    controller:controller,

    maxLines: isAddress ? 4 : 1,
    decoration: InputDecoration(
      hintText: hint,
      label: Text(lable),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
