import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/colors.dart';

class completedInvoiceDetails extends StatefulWidget {
  const completedInvoiceDetails({Key? key}) : super(key: key);

  @override
  State<completedInvoiceDetails> createState() =>
      _completedInvoiceDetailsState();
}

class _completedInvoiceDetailsState extends State<completedInvoiceDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text(
          "Invoice Completed Details",
          style: GoogleFonts.aleo(letterSpacing: 2),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Name :  ",
                            style: GoogleFonts.andadaPro(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Kiran Raj",
                            style: GoogleFonts.andadaPro(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Invoice  : ",
                              style: GoogleFonts.andadaPro(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Text(
                            "INV-21-12-009",
                            style: GoogleFonts.andadaPro(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Date  : ",
                            style: GoogleFonts.andadaPro(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "14/02/2023",
                            style: GoogleFonts.andadaPro(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Food  : ",
                              style: GoogleFonts.andadaPro(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Text("Biriyani",
                              style: GoogleFonts.andadaPro(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Total Amount  : ",
                              style: GoogleFonts.andadaPro(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Text("AED 85",
                              style: GoogleFonts.andadaPro(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Cash/Credit/Card  : ",
                              style: GoogleFonts.andadaPro(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Text("Card",
                              style: GoogleFonts.andadaPro(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Status : ",
                              style: GoogleFonts.andadaPro(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Text("Paid",
                              style: GoogleFonts.andadaPro(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
