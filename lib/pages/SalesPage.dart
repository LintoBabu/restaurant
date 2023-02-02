import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/Model/cart_model.dart';
import 'package:restaurant/Provider/cartProvider.dart';
import 'package:restaurant/constants/colors.dart';
import 'package:restaurant/db/db.dart';
import 'package:restaurant/pages/cartPage.dart';
import 'package:restaurant/pages/customerNew.dart';
import 'package:badges/badges.dart' as badges;

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

  // final items = ['Bread', 'Bun', 'Cake', 'Rice'];
  // String? value;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
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
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: productName.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 13),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          spreadRadius: 1,
                          blurRadius: 8),
                    ],
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundImage: NetworkImage(
                          productImage[index].toString(),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(productName[index].toString(),
                                style: GoogleFonts.arvo(fontSize: 22)),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "\$" + productPrice[index].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          dbHelper!
                              .insert(
                            Cart(
                              id: index,
                              productId: index.toString(),
                              productName: productName[index].toString(),
                              initialPrice: productPrice[index],
                              productPrice: productPrice[index],
                              quantity: 1,
                              image: productImage[index].toString(),
                            ),
                          )
                              .then((value) {
                            final snackBar = SnackBar(
                              content: Row(
                                children: [
                                  Text(
                                    "Item Added to Cart",
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: 20,
                                  )
                                ],
                              ),
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.all(15),
                              backgroundColor: colorAppbar,
                              elevation: 7,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            cart.addTotalPrice(
                                double.parse(productPrice[index].toString()));
                            cart.addCounter();
                          }).onError((error, stackTrace) {
                            final snackBar = SnackBar(
                              content: Row(
                                children: [
                                  Text(
                                    "Product Already Exists in the Cart",
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.warning,
                                    color: Colors.white,
                                    size: 20,
                                  )
                                ],
                              ),
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.all(15),
                              backgroundColor: colorAppbar,
                              elevation: 7,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            print(error.toString());
                          });
                        },
                        child: Container(
                          height: 35,
                          width: 100,
                          decoration: BoxDecoration(
                            color: buttonColors,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              "Add",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  // DropdownMenuItem<String> buildmenu(String item) => DropdownMenuItem(
  //       value: item,
  //       child: Text(
  //         item,
  //         style: TextStyle(fontWeight: FontWeight.bold),
  //       ),
  //     );
}
