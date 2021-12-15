import 'package:flutter/material.dart';

Container container(String text) {
  return Container(
    width: 70,
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10)),
    child: Text(
      text,
      textAlign: TextAlign.center,
    ),
  );
}

SizedBox sizedBox(controller, String hintText) {
  return SizedBox(
    width: 50,
    child: TextField(
      style: TextStyle(fontSize: 24),
      textAlign: TextAlign.center,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
    ),
  );
}

Container textWidth(String text25, String text50) {
  return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text25,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(width: 5),
          Text('&', style: TextStyle(fontSize: 20)),
          SizedBox(width: 5),
          Text(
            text50,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ));
}

TextStyle textStyle() {
  return TextStyle(
    fontSize: 20,
  );
}
