import 'dart:ui';
import 'package:flutter/cupertino.dart';

class Topping {
  final String name;
  final Color color;
  final double price;
  final String image;
  final IconData icon;

  Topping({
    required this.name,
    required this.color,
    required this.price,
    required this.icon,
    required this.image,
  });
}