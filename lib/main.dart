import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/Provider/cartProvider.dart';
import 'package:restaurant/pages/loginPage/loginPage.dart';

void main() {
  runApp(const newApp());
}

class newApp extends StatelessWidget {
  const newApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: Builder(
        builder: (BuildContext context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: loginPage(),
          );
        },
      ),
    );
  }
}
