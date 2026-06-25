import 'package:flutter/material.dart';
import 'pages/base_app_screen.dart';
import 'package:snack_cart/core/constants/color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carrito Snack',
      theme: ThemeData(
        primaryColor: AppColor.primary,
      ),
      themeMode: ThemeMode.system,
      home: const BaseAppScreen(),
    );
  }
}
