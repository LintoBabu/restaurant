import 'package:flutter/material.dart';

class pendingMess extends StatefulWidget {
  const pendingMess({Key? key}) : super(key: key);

  @override
  State<pendingMess> createState() => _pendingMessState();
}

class _pendingMessState extends State<pendingMess> {
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
                    title: Text("Rahul"),
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
                        subtitle: Text("Biriyani"),
                        trailing: Text("Pending",style: TextStyle(color: Colors.red),),
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
                    title: Text("Kiran"),
                    subtitle: Text("11/02/2023"),
                    children: [
                      ListTile(
                        title: Text("Breakfast"),
                        subtitle: Text("Poori"),
                        trailing: Column(
                          children: [
                            Text("Pending",style: TextStyle(color: Colors.red)),
                          ],
                        ),
                      ),
                      ListTile(
                        title: Text("Lunch"),
                        subtitle: Text("Fried Rice"),
                        trailing: Text("Pending",style: TextStyle(color: Colors.red)),
                      ),
                      ListTile(
                        title: Text("Dinner"),
                        subtitle: Text("Shawarma"),
                        trailing: Text("Pending",style: TextStyle(color: Colors.red)),
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
