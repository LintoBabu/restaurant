import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/Model/cart_model.dart';
import 'package:restaurant/Provider/cartProvider.dart';
import 'package:restaurant/constants/colors.dart';
import 'package:restaurant/db/db.dart';


class DinnerPage extends StatefulWidget {
  const DinnerPage({Key? key}) : super(key: key);

  @override
  State<DinnerPage> createState() => _DinnerPageState();
}

class _DinnerPageState extends State<DinnerPage> {
  DBHelper? dbHelper = DBHelper();
  List<String> productName = [
    'Porotta',
    'Al faham',
    'Noodles',
    'Shawarma',
    'Shawai',
  ];

  List<int> productPrice = [10, 20, 30, 40,50];
  List<String> productImage = [
    'https://i.pinimg.com/originals/75/f1/fa/75f1fa63f858931621bbfe13cf12c2ca.jpg',
    'https://i0.wp.com/nasfoodcorner.com/wp-content/uploads/2020/03/Chicken-Alfaham-NFC-Web-Img-1.jpg',
    'https://www.indianhealthyrecipes.com/wp-content/uploads/2022/02/veg-noodles-vegetable-noodles-recipe.jpg',
    'https://www.licious.in/blog/wp-content/uploads/2020/12/Chicken-Shawarma.jpg',
    'https://s3-ap-southeast-1.amazonaws.com/sb-singleserver-prod-bucket/7fb7417a53ae240537f63bf4ced89e18/o_1531478216.jpg',
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
    return Scaffold(
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.only(left: 10),
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFFD4E7FE),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.teal,
                ),
              ),
              child: DropdownButton(
                value: value,
                hint: Text("Choose Customer"),
                dropdownColor: Color(0xFFD4E7FE),
                icon: Icon(Icons.arrow_drop_down_outlined),
                iconSize: 25,
                isExpanded: true,
                iconEnabledColor: Colors.teal,
                items: itemz.map(BuildMenuItem).toList(),
                onChanged: (value) => setState(() => this.value = value),
              ),
            ),
          ),
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
                              "\AED " + productPrice[index].toString(),
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
}
