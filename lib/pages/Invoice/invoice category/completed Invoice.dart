import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Details/completedInvoice.dart';

class completedInvoice extends StatefulWidget {
  const completedInvoice({Key? key}) : super(key: key);

  @override
  State<completedInvoice> createState() => _completedInvoiceState();
}

class _completedInvoiceState extends State<completedInvoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => completedInvoiceDetails()));
              },
              child: Card(
                elevation: 7,
                child: Container(
                  height: 83,
                  child: ListTile(
                    title: Text(
                      "Kiran Raj",
                      style: GoogleFonts.anekGujarati(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Invoice : 889663217",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "14/01/2023",
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                    trailing: Column(
                      children: [
                        Text(
                          "AED 85",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: PopupMenuButton(
                            itemBuilder: (_) => [
                              PopupMenuItem(
                                height: 25,
                                onTap: () {},
                                child: Row(
                                  children: const [
                                    Icon(Icons.picture_as_pdf),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "PDF",
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
