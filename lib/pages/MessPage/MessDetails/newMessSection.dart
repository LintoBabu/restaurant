import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';

class MessSection extends StatefulWidget {
  const MessSection({Key? key}) : super(key: key);

  @override
  State<MessSection> createState() => _MessSectionState();
}

class _MessSectionState extends State<MessSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MESS",
          style: GoogleFonts.aleo(letterSpacing: 3),
        ),
        centerTitle: true,
        backgroundColor: colorAppbar,
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: 'Add Mess Section..',
                hintStyle: const TextStyle(color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.teal, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.teal, width: 1),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(60))),
            width: MediaQuery.of(context).size.width / 1.5,
            height: 45,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton.icon(
              label: Text(
                'SAVE',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: buttonColors, // foreground
              ),
              onPressed: () {},
              icon: const Icon(Icons.save),
            ),
          ),
        ],
      ),
    );
  }
}
