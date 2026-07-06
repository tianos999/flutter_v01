import 'package:flutter/material.dart';
import 'pages/root_app.dart';
import 'package:snack_cart/core/constants/app_color.dart';

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
        useMaterial3: true,
        primaryColor: AppColor.primaryMagenta,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'TianosFontShoika',
      ),
      themeMode: ThemeMode.system,
      home: const RootApp(),
    );
  }
}
