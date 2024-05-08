import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:todo_app/utils/AppColor.dart';

Widget button({ontap, screenwidth, screenheight, text, height, width}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
        width: screenwidth * width,
        height: screenheight * height,
        decoration: BoxDecoration(
          color: AppColor.buttonColor,
          borderRadius: BorderRadius.circular(screenwidth * 0.025),
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins_Regular',
              fontSize: screenheight * 0.024),
        ))),
  );
}

Widget text_Field({String? string, TextEditingController? controller}) {
  return TextField(
    controller: controller,
    decoration:
        InputDecoration(hintText: string, fillColor: AppColor.AppBarColor),
  );
}

Widget addVerticalSpace(double height) {
  return SizedBox(
    height: height,
  );
}

showusccessmessage(context, message) {
  final snackbar = SnackBar(
    content: Text(
      message,
      style: TextStyle(color: Colors.black),
    ),
    backgroundColor: Colors.white,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}

showerrormessage(context, message) {
  final snackbar = SnackBar(
    content: Text(
      message,
      style: TextStyle(color: Colors.black),
    ),
    backgroundColor: Colors.red,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}

List global_Data = [];
List Data = [];
