import 'package:flutter/material.dart';

class completedMess extends StatefulWidget {
  const completedMess({Key? key}) : super(key: key);

  @override
  State<completedMess> createState() => _completedMessState();
}

class _completedMessState extends State<completedMess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  elevation: 4,
                  color: Colors.white,
                  child: ExpansionTile(
                    title: Text("Linto"),
                    subtitle: Text("10/02/2023"),
                    children: [
                      ListTile(
                        title: Text("Breakfast"),
                        subtitle: Text("Poori"),
                        trailing: Column(
                          children: [
                            Text("10.00 AM"),
                          ],
                        ),
                      ),
                      ListTile(
                        title: Text("Lunch"),
                        subtitle: Text("Biriyani"),
                        trailing: Text("1.00 PM"),
                      ),
                      ListTile(
                        title: Text("Dinner"),
                        subtitle: Text("Porotta"),
                        trailing: Text("9.00 PM"),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  elevation: 4,
                  color: Colors.white,
                  child: ExpansionTile(
                    title: Text("Jubin"),
                    subtitle: Text("11/02/2023"),
                    children: [
                      ListTile(
                        title: Text("Breakfast"),
                        subtitle: Text("Appam"),
                        trailing: Column(
                          children: [
                            Text("10.00 AM"),
                          ],
                        ),
                      ),
                      ListTile(
                        title: Text("Lunch"),
                        subtitle: Text("Kuzhi MAnthi"),
                        trailing: Text("1.00 PM"),
                      ),
                      ListTile(
                        title: Text("Dinner"),
                        subtitle: Text("Al faham"),
                        trailing: Text("9.00 PM"),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
