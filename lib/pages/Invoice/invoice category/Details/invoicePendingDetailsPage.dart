import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/colors.dart';

class pendingInvoiceDetails extends StatefulWidget {
  const pendingInvoiceDetails({Key? key}) : super(key: key);

  @override
  State<pendingInvoiceDetails> createState() => _pendingInvoiceDetailsState();
}

class _pendingInvoiceDetailsState extends State<pendingInvoiceDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Invoice Pending Details",
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
                            "Rahul Vs",
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
                            "INV-21-12-010",
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
                          Icon(Icons.credit_card),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Credit",
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
                      Row(
                        children: [
                          Icon(
                            Icons.approval,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Cash Given",
                            style: GoogleFonts.andadaPro(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text("AED 20",
                              style: GoogleFonts.andadaPro(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey)),
                        ],
                      ),
                      Divider(
                        thickness: 2,color: Colors.black,
                      ),
                      Row(
                        children: [
                          Icon(Icons.price_change_sharp),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Balance",
                            style: GoogleFonts.andadaPro(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text("AED 65 ",
                              style: GoogleFonts.andadaPro(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red)),
                        ],
                      ),
                      ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(buttonColors),
                        ),
                        onPressed: () {},
                        icon: Icon(Icons.payment),
                        label: Text("PAY"),
                      )
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
