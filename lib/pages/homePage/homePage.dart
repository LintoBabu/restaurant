import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/constants/colors.dart';
import 'package:restaurant/pages/Delivery/DeliveryPage.dart';
import 'package:restaurant/pages/MessPage/MessDetails/MessValidity/messDetailsValidity.dart';
import 'package:restaurant/pages/MessPage/addMess.dart';
import 'package:restaurant/pages/salesPage/SalesPage.dart';
import 'package:restaurant/pages/customerList/customerNew.dart';
import 'package:restaurant/pages/Invoice/invoicePage.dart';
import 'package:url_launcher/url_launcher.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  String _url = "https://bluesky.ae/index.html#page-aboutus";

  void _launchURL(urldetails) async => await canLaunch(urldetails)
      ? await launch(urldetails)
      : throw 'Could not launch ${urldetails}';

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
              ListTile(
                leading: Icon(Icons.notes_rounded),
                title: Text(
                  'About us',
                  style: GoogleFonts.kanit(fontSize: 20),
                ),
                onTap: () {
                  _launchURL(_url);
                },
              ),
              Container(
                height: MediaQuery.of(context).size.width / 1.2,
              ),
              Container(
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
              Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height / 12,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 14,
                      child: Image.asset("assets/images/img.png"),
                    ),
                  )),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
                  width: MediaQuery.of(context).size.width / 2,
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
                          "assets/images/pos-terminal.png",
                          height: 60,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => invoicePage()));
                },
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width / 2,
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
                          "assets/images/bill.png",
                          height: 60,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => customerPage()));
                },
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width / 2,
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
                          "Customer",
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
                          "assets/images/customer.png",
                          height: 60,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => addMessPage()));
                },
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width / 2,
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
                          "Mess",
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
                          "assets/images/hot-pot.png",
                          height: 60,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => deliveryPage()));
                },
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width / 2,
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
                          "Delivery",
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
                          "assets/images/delivery-man.png",
                          height: 60,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => messDetailsPackage()));
                },
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width / 2,
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
                          "Mess Details",
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
                          "assets/images/restaurant.png",
                          height: 60,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
