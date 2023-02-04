import 'package:flutter/material.dart';

class lunchPage extends StatefulWidget {
  const lunchPage({Key? key}) : super(key: key);

  @override
  State<lunchPage> createState() => _lunchPageState();
}

class _lunchPageState extends State<lunchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Hello"),
      ),
    );
  }
}
