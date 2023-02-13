import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/Provider/cartProvider.dart';
import 'package:restaurant/constants/colors.dart';
import 'package:restaurant/db/db.dart';
import 'package:restaurant/pages/salesPage/cart/cartPage.dart';
import 'package:restaurant/pages/customerList/customerNew.dart';
import 'package:badges/badges.dart' as badges;
import 'package:restaurant/pages/food%20category/dessert.dart';
import 'package:restaurant/pages/food%20category/juicePage.dart';
import 'package:restaurant/pages/food%20category/snacks.dart';

import '../food category/DinnerPage.dart';
import '../food category/breakfastPage.dart';
import '../food category/lunchPage.dart';

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
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  height: 45,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD4E7FE),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: DropdownButton(
                    underline: SizedBox.shrink(),
                    value: value,
                    hint: const Text("Choose Customer"),
                    dropdownColor: const Color(0xFFD4E7FE),
                    icon: const Icon(Icons.arrow_drop_down_outlined),
                    iconSize: 25,
                    isExpanded: true,
                    items: itemz.map(BuildMenuItem).toList(),
                    onChanged: (value) => setState(() => this.value = value),
                  ),
                ),
              ],
            ),
            centerTitle: true,
            backgroundColor: colorAppbar,
            elevation: 0,
            flexibleSpace: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const cartScreen()));
                },
                icon: badges.Badge(
                  badgeContent: Consumer<CartProvider>(
                    builder: (context, value, child) {
                      return Text(
                        value.getCounter().toString(),
                        style: const TextStyle(color: Colors.white),
                      );
                    },
                  ),
                  child: const Icon(Icons.shopping_cart),
                  badgeAnimation: const badges.BadgeAnimation.fade(
                    animationDuration: Duration(microseconds: 2),
                  ),
                ),
              )
            ],
            bottom: const TabBar(
              isScrollable: true,
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 5,
              tabs: [
                Tab(
                  text: "Breakfast",
                ),
                Tab(
                  text: "Lunch",
                ),
                Tab(
                  text: "Dinner",
                ),
                Tab(
                  text: "Snacks",
                ),
                Tab(
                  text: "Juice",
                ),
                Tab(
                  text: "Desert",
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              breakFast(),
              lunchPage(),
              DinnerPage(),
              SnacksPage(),
              juicePage(),
              dessertPage()
            ],
          ),
        ),
      ),
    );
  }
}
