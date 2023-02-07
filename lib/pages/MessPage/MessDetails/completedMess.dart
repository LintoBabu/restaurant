import 'package:flutter/material.dart';

class completedMess extends StatefulWidget {
  const completedMess({Key? key}) : super(key: key);

  @override
  State<completedMess> createState() => _completedMessState();
}

class _completedMessState extends State<completedMess> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Hello"),
    );
  }
}
