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
      appBar: AppBar(
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
              height: MediaQuery.of(context).size.height / 2,
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
                        children: [
                          Icon(Icons.person_outline),
                          SizedBox(
                            width: 20,
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
                        children: [
                          Icon(Icons.sticky_note_2_sharp),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "889663217",
                            style: GoogleFonts.andadaPro(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.date_range_sharp),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "14/01/2023",
                            style: GoogleFonts.andadaPro(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.credit_card),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Cash",
                              style: GoogleFonts.andadaPro(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.request_page_sharp),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Total",
                            style: GoogleFonts.andadaPro(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text("AED 85",
                              style: GoogleFonts.andadaPro(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange)),
                        ],
                      ),
                      Divider(
                        thickness: 2,
                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          Icon(Icons.price_change_sharp),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Status",
                            style: GoogleFonts.andadaPro(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text("Completed",
                              style: GoogleFonts.andadaPro(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red)),
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
