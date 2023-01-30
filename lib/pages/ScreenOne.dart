import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/pages/cartPage.dart';

import '../widgets/itemWidgets.dart';

class screenOne extends StatefulWidget {
  const screenOne({Key? key}) : super(key: key);

  @override
  State<screenOne> createState() => _screenOneState();
}

class _screenOneState extends State<screenOne> {
  final items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
  String? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page One", style: GoogleFonts.aleo(letterSpacing: 3)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(12), boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 3))
        ]),
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => cartPage()));
          },
          child: Icon(
            Icons.shopping_cart_outlined,
            color: Colors.blueAccent,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.only(left: 10),
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFFD4E7FE),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.teal,
                ),
              ),
              child: DropdownButton<String>(
                hint: Text("Select Options"),
                dropdownColor: Color(0xFFD4E7FE),
                icon: Icon(Icons.arrow_drop_down_outlined),
                iconSize: 25,
                isExpanded: true,
                iconEnabledColor: Colors.teal,
                items: items.map(buildmenu).toList(),
                value: value,
                onChanged: (value) {
                  setState(() {
                    this.value = value;
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                itemWidgets(),
                itemWidgets(),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  DropdownMenuItem<String> buildmenu(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      );
}
