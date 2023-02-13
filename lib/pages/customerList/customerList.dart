import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';

class customerList extends StatefulWidget {
  const customerList({Key? key}) : super(key: key);

  @override
  State<customerList> createState() => _customerListState();
}

class _customerListState extends State<customerList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:
              Text("Customer List", style: GoogleFonts.aleo(letterSpacing: 3)),
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
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  elevation: 4,
                  color: Colors.white,
                  child: ExpansionTile(
                    collapsedTextColor: Colors.black,
                    title: Text(
                      "Linto Babu",
                      style: GoogleFonts.aleo(fontSize: 19),
                    ),
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.phone),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "9966224477",
                                    style: GoogleFonts.aleo(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.email),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text("linto@gmail.com",
                                      style: GoogleFonts.aleo(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.add_business),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text("Abc Villa/Kollam",
                                      style: GoogleFonts.aleo(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.note),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text("Near Pathway",
                                      style: GoogleFonts.aleo(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        ),
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
                    collapsedTextColor: Colors.black,
                    title: Text(
                      "Rahul R",
                      style: GoogleFonts.aleo(fontSize: 19),
                    ),
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.phone),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "77884477",
                                    style: GoogleFonts.aleo(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.email),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text("rahul@gmail.com",
                                      style: GoogleFonts.aleo(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.add_business),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text("Abc Villa/Thrissur",
                                      style: GoogleFonts.aleo(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.note),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text("Near U-Turn",
                                      style: GoogleFonts.aleo(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ));
  }
}
