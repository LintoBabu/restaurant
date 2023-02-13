import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/Model/cart_model.dart';
import 'package:restaurant/Provider/cartProvider.dart';
import 'package:restaurant/constants/colors.dart';
import 'package:restaurant/db/db.dart';

class dessertPage extends StatefulWidget {
  const dessertPage({Key? key}) : super(key: key);

  @override
  State<dessertPage> createState() => _dessertPageState();
}

class _dessertPageState extends State<dessertPage> {
  DBHelper? dbHelper = DBHelper();
  List<String> productName = [
    'Tiramisu',
    'Almond cake',
    'Maltesers',
    'Meringue Pie',
    'Amaretto Tart'
  ];
  List<int> productPrice = [10, 20, 30, 40, 50];
  List<String> productImage = [
    'https://img.taste.com.au/rwdBhyIk/w354-h236-cfill-q80/taste/2010/01/tiramisu-118980-2.jpg',
    'https://img.taste.com.au/F3ejZ2nU/w354-h236-cfill-q80/taste/2016/11/almond-and-date-cake-94537-1.jpeg',
    'https://img.taste.com.au/Shc7epC8/w354-h236-cfill-q80/taste/2016/11/maltesers-tiramisu-74785-1.jpeg',
    "https://thumbs.dreamstime.com/b/puri-bhaji-indian-dish-made-up-aloo-38512979.jpg",
    'https://img.taste.com.au/WsXCMk8v/w354-h236-cfill-q80/taste/2016/11/amaretto-tart-84359-1.jpeg'
  ];

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
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            productName[index].toString(),
                            style: GoogleFonts.arvo(fontSize: 18),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "AED " + productPrice[index].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.red),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
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
                                cart.addTotalPrice(double.parse(
                                    productPrice[index].toString()));
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
                              width: 50,
                              decoration: BoxDecoration(
                                color: buttonColors,
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Center(
                                  child: Icon(
                                Icons.add_circle_outline_outlined,
                                color: Colors.white,
                              )),
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
