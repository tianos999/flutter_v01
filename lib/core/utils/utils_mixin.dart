import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:snack_cart/core/constants/app_color.dart';

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

  SizedBox TsizedBox({double? width, double? height, Color? color}) {

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

  SliverAppBar tianosSliverAppBar({required String data01, required String data02, required IconData icon, required Null Function() onPressed}) {
    return SliverAppBar(
      // The height when the user scrolls down completely
      expandedHeight: 10.0,

      // The height when the user scrolls up and the bar collapses
      collapsedHeight: 65.0,

      // Controls the internal content area height
      toolbarHeight: 60.0,

      backgroundColor: Colors.white,
      pinned: true,
      snap: true,
      floating: true,
      title: _tianosSliverAppBarTitle(data01: data01, data02: data02, icon: icon),
    );
  }

  _tianosSliverAppBarTitle({required String data01, required String data02, required IconData icon}) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data01,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Colors.lightBlue,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  data02,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                    height: 1.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}