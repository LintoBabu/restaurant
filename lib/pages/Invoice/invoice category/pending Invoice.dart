import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Details/invoicePendingDetailsPage.dart';

class pendingInvoice extends StatefulWidget {
  const pendingInvoice({Key? key}) : super(key: key);

  @override
  State<pendingInvoice> createState() => _pendingInvoiceState();
}

class _pendingInvoiceState extends State<pendingInvoice> {
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
                    builder: (context) => pendingInvoiceDetails(),
                  ),
                );
              },
              child: Card(
                child: ListTile(
                  leading: const Text(
                    "AED 65",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                  title: Text(
                    "Rahul Vs",
                    style: GoogleFonts.anekGujarati(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Invoice : INV-21-12-010",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "14/02/2023",
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                  trailing: PopupMenuButton(
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
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
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
