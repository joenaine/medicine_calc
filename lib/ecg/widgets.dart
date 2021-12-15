import 'package:flutter/material.dart';

SizedBox sizedBox(controller, String hintText) {
  return SizedBox(
    width: 80,
    child: TextField(
      style: TextStyle(fontSize: 48),
      textAlign: TextAlign.center,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
    ),
  );
}

Card cardBox(control, String hintText) {
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.teal,
      child: TextField(
        textAlign: TextAlign.center,
        controller: control,
        decoration: InputDecoration(
          hintText: hintText,
        ),
        keyboardType: TextInputType.numberWithOptions(decimal: true),
      ));
}

Container decor(controller, String hintText) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey[200],
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(20),
    ),
    child: sizedBox(controller, hintText),
  );
}

Text texT(String stuff) {
  return Text(
    stuff,
    style: TextStyle(fontSize: 22),
  );
}
