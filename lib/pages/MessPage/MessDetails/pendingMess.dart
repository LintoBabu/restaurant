import 'package:flutter/cupertino.dart';

class pendingMess extends StatefulWidget {
  const pendingMess({Key? key}) : super(key: key);

  @override
  State<pendingMess> createState() => _pendingMessState();
}

class _pendingMessState extends State<pendingMess> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Hello"),
    );
  }
}
