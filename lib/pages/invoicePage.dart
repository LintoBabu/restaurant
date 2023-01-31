import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class invoicePage extends StatefulWidget {
  const invoicePage({Key? key}) : super(key: key);

  @override
  State<invoicePage> createState() => _invoicePageState();
}

class _invoicePageState extends State<invoicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Invoice Page", style: GoogleFonts.aleo(letterSpacing: 3)),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.note),
              label: Text("Completed Invoice"),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.sticky_note_2_outlined),
              label: Text("Pending Invoice"),
            ),
          ],
        ),
      ),
    );
  }
}
