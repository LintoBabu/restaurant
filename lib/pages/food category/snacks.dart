import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/Model/cart_model.dart';
import 'package:restaurant/Provider/cartProvider.dart';
import 'package:restaurant/constants/colors.dart';
import 'package:restaurant/db/db.dart';

class SnacksPage extends StatefulWidget {
  const SnacksPage({Key? key}) : super(key: key);

  @override
  State<SnacksPage> createState() => _SnacksPageState();
}

class _SnacksPageState extends State<SnacksPage> {
  DBHelper? dbHelper = DBHelper();
  List<String> productName = [
    'Burger',
    'Sandwich',
    'Bread Cutlet',
    'Bajji',
  ];
  List<int> productPrice = [10, 20, 30, 40];
  List<String> productImage = [
    "https://b.zmtcdn.com/data/pictures/chains/2/19170112/8637464588170cefeaf0896dde252083.jpg?fit=around|300:273&crop=300:273;*,*",
    'https://upload.wikimedia.org/wikipedia/commons/b/bd/Club-sandwich.jpg',
    "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2014/2/19/0/FNK_Breaded-Chicken-Cutlets_s4x3.jpg.rend.hgtvcom.616.462.suffix/1392869571158.jpeg",
    "https://asafoetida.in/wp-content/uploads/2021/01/baji.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: productName.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 12.0,
                  mainAxisExtent: 200),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          spreadRadius: 1,
                          blurRadius: 8),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundImage: NetworkImage(
                            productImage[index].toString(),
                          ),
                        ),
                        Text(
                          productName[index].toString(),
                          style: GoogleFonts.arvo(fontSize: 18),
                        ),
                        Text(
                          "\AED " + productPrice[index].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.red),
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
                                duration: Duration(seconds: 1),
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
                                      size: 18,
                                    )
                                  ],
                                ),
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.all(15),
                                backgroundColor: colorAppbar,
                                elevation: 7,
                                duration: Duration(seconds: 1),
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
                              borderRadius: BorderRadius.circular(5),
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
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
