import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/Model/cart_model.dart';
import 'package:restaurant/Provider/cartProvider.dart';
import 'package:restaurant/constants/colors.dart';
import 'package:restaurant/db/db.dart';
import 'package:restaurant/pages/cartPage.dart';
import 'package:restaurant/pages/category/breakfastPage.dart';
import 'package:restaurant/pages/category/lunchPage.dart';
import 'package:restaurant/pages/customerNew.dart';
import 'package:badges/badges.dart' as badges;

import 'category/DinnerPage.dart';

class SalesPage extends StatefulWidget {
  const SalesPage({Key? key}) : super(key: key);

  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  DBHelper? dbHelper = DBHelper();
  List<String> productName = [
    'Bread',
    'Bun',
    'Cake',
    'Rice',
  ];
  List<int> productPrice = [10, 20, 30, 40];
  List<String> productImage = [
    'https://images.unsplash.com/photo-1598373182133-52452f7691ef?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGJyZWFkfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1592811773343-9abf0b1a6920?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YnVufGVufDB8fDB8fA%3D%3D&w=1000&q=80',
    'https://images.unsplash.com/photo-1578985545062-69928b1d9587?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8NHx8fGVufDB8fHx8&w=1000&q=80',
    'https://img.freepik.com/free-photo/cooked-plain-white-basmati-rice-steamed-rice-bowl_466689-74907.jpg?w=2000',
  ];

  final itemz = ['Linto', 'Rahul', 'Jubin', 'Rumaise'];
  String? value;

  DropdownMenuItem<String> BuildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Sales",
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
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => customerPage(),
                    ),
                  );
                },
                icon: Icon(Icons.add),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => cartScreen()));
              },
              icon: badges.Badge(
                badgeContent: Consumer<CartProvider>(
                  builder: (context, value, child) {
                    return Text(
                      value.getCounter().toString(),
                      style: TextStyle(color: Colors.white),
                    );
                  },
                ),
                child: Icon(Icons.shopping_cart),
                badgeAnimation: badges.BadgeAnimation.fade(
                  animationDuration: Duration(microseconds: 2),
                ),
              ),
            )
          ],
          bottom: TabBar(tabs: [
            Tab(
              text: "Breakfast",
            ),
            Tab(
              text: "Lunch",
            ),
            Tab(
              text: "Dinner",
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            breakFast(),
            lunchPage(),
            DinnerPage(),
          ],
        ),
      ),
    );
  }
}