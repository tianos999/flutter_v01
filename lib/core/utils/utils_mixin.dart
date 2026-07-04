import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

mixin UtilsMixin {

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  SizedBox sizedBox({double? width, double? height, Color? color}) {

    height = height ?? 20.0;
    width = width ?? double.infinity;
    color = color ?? Colors.white;

    return SizedBox(
      height: height,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }
}