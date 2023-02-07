import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/pages/MessPage/MessDetails/completedMess.dart';
import 'package:restaurant/pages/MessPage/MessDetails/pendingMess.dart';

import '../../constants/colors.dart';

class todayMessPage extends StatefulWidget {
  const todayMessPage({Key? key}) : super(key: key);

  @override
  State<todayMessPage> createState() => _todayMessPageState();
}

class _todayMessPageState extends State<todayMessPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "TODAY MESS",
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
                text: "Completed",
              ),
              Tab(
                text: "Pending",
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          completedMess(),
          pendingMess(),
        ]),
      ),
    );
  }
}
