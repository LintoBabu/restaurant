import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/constants/colors.dart';
import 'invoice category/completed Invoice.dart';
import 'invoice category/pending Invoice.dart';

class invoicePage extends StatefulWidget {
  const invoicePage({Key? key}) : super(key: key);

  @override
  State<invoicePage> createState() => _invoicePageState();
}

class _invoicePageState extends State<invoicePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Invoice",
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
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 5,
              tabs: [
                Tab(
                  text: "Pending",
                ),
                Tab(
                  text: "Completed",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              pendingInvoice(),
              completedInvoice(),
            ],
          ),
        ));
  }
}
