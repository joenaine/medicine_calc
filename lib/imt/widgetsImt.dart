import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

SizedBox sizedBox(controller, String hintText) {
  return SizedBox(
    width: 50,
    child: TextField(
      textAlign: TextAlign.center,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
    ),
  );
}
