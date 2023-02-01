import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/constants/colors.dart';
import 'package:restaurant/pages/SalesPage.dart';
import 'package:restaurant/pages/customerDetails.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.notification_add_rounded))
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height / 2,
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: colorAppbar),
                  accountName: Text(
                    "Restaurants",
                    style: GoogleFonts.zenDots(fontSize: 25),
                  ),
                  accountEmail: Divider(
                    color: Colors.white,
                    thickness: 2,
                    indent: 1,
                    endIndent: 90,
                  ),
                  currentAccountPicture: Image.asset(
                    "assets/images/fork.png",
                    color: Colors.white,
                  )),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text(
                  'Logout',
                  style: GoogleFonts.kanit(fontSize: 20),
                ),
                onTap: () {},
              ),
              Container(
                height: MediaQuery.of(context).size.width / 1,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Version 1.0.0",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            fontFamily: 'Montserrat',
                            color: Colors.black),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height / 12,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                        height: MediaQuery.of(context).size.height / 14,
                        child: Image.asset("assets/images/img.png"),),
                  )),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SalesPage(),
                  ),
                );
              },
              child: Container(
                height: 150,
                width: 150,
                child: Card(
                  elevation: 7,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: buttonColors,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sales",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.notoSans(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        "assets/images/bill.png",
                        height: 60,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 150,
              width: 150,
              child: Card(
                elevation: 7,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: buttonColors,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Invoice",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.notoSans(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      "assets/images/pos-terminal.png",
                      height: 60,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
