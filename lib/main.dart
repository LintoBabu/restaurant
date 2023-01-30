import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/pages/loginPage.dart';

void main() {
  runApp(const newApp());
}

class newApp extends StatelessWidget {
  const newApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: loginPage(),
    );
  }
}
