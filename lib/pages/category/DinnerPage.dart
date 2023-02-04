import 'package:flutter/material.dart';

class DinnerPage extends StatefulWidget {
  const DinnerPage({Key? key}) : super(key: key);

  @override
  State<DinnerPage> createState() => _DinnerPageState();
}

class _DinnerPageState extends State<DinnerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Hello"),
      ),
    );
  }
}
