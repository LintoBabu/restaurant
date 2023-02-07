import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/Model/cart_model.dart';
import 'package:restaurant/Provider/cartProvider.dart';
import 'package:restaurant/constants/colors.dart';
import 'package:restaurant/db/db.dart';

class breakFast extends StatefulWidget {
  const breakFast({Key? key}) : super(key: key);

  @override
  State<breakFast> createState() => _breakFastState();
}

class _breakFastState extends State<breakFast> {
  DBHelper? dbHelper = DBHelper();
  List<String> productName = [
    'Bread',
    'Bun',
    'Chapati',
    'Poori',
    'Dosa',
  ];
  List<int> productPrice = [10, 20, 30, 40, 50];
  List<String> productImage = [
    'https://images.unsplash.com/photo-1598373182133-52452f7691ef?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGJyZWFkfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1592811773343-9abf0b1a6920?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YnVufGVufDB8fDB8fA%3D%3D&w=1000&q=80',
    "https://media.istockphoto.com/id/508374340/photo/homemade-chapati.jpg?s=612x612&w=0&k=20&c=lozsrleZ88efHFdMYCtUkyUW5mTqXVDoFp_jtI2s53Q=",
    "https://thumbs.dreamstime.com/b/puri-bhaji-indian-dish-made-up-aloo-38512979.jpg",
    "https://thumbs.dreamstime.com/b/indian-dosa-special-food-made-rice-lentils-south-india-84751483.jpg"
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
      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Container(
          //     padding: EdgeInsets.only(left: 10),
          //     width: MediaQuery.of(context).size.width,
          //     height: 50,
          //     decoration: BoxDecoration(
          //       color: Color(0xFFD4E7FE),
          //       borderRadius: BorderRadius.circular(8),
          //       border: Border.all(
          //         color: Colors.teal,
          //       ),
          //     ),
          //     child: DropdownButton(
          //       value: value,
          //       hint: Text("Choose Customer"),
          //       dropdownColor: Color(0xFFD4E7FE),
          //       icon: Icon(Icons.arrow_drop_down_outlined),
          //       iconSize: 25,
          //       isExpanded: true,
          //       iconEnabledColor: Colors.teal,
          //       items: itemz.map(BuildMenuItem).toList(),
          //       onChanged: (value) => setState(() => this.value = value),
          //     ),
          //   ),
          // ),
          SizedBox(height: 30,),
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
              padding: const EdgeInsets.only(left: 10,right: 10),
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
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
// ListView.builder(
// itemCount: productName.length,
// itemBuilder: (context, index) {
// return Container(
// padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
// margin: EdgeInsets.symmetric(vertical: 8, horizontal: 13),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(20),
// color: Colors.white,
// boxShadow: [
// BoxShadow(
// color: Colors.black.withOpacity(0.4),
// spreadRadius: 1,
// blurRadius: 8),
// ],
// ),
// child: Row(
// children: [
// CircleAvatar(
// radius: 45,
// backgroundImage: NetworkImage(
// productImage[index].toString(),
// ),
// ),
// SizedBox(
// width: 10,
// ),
// Expanded(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(productName[index].toString(),
// style: GoogleFonts.arvo(fontSize: 22)),
// SizedBox(
// height: 10,
// ),
// Text(
// "\AED " + productPrice[index].toString(),
// style: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 18,
// color: Colors.red),
// ),
// ],
// ),
// ),
// InkWell(
// onTap: () {
// dbHelper!
//     .insert(
// Cart(
// id: index,
// productId: index.toString(),
// productName: productName[index].toString(),
// initialPrice: productPrice[index],
// productPrice: productPrice[index],
// quantity: 1,
// image: productImage[index].toString(),
// ),
// )
//     .then((value) {
// final snackBar = SnackBar(
// content: Row(
// children: [
// Text(
// "Item Added to Cart",
// style: GoogleFonts.aBeeZee(
// fontSize: 15,
// fontWeight: FontWeight.bold),
// ),
// SizedBox(
// width: 10,
// ),
// Icon(
// Icons.done,
// color: Colors.white,
// size: 20,
// )
// ],
// ),
// behavior: SnackBarBehavior.floating,
// margin: EdgeInsets.all(15),
// backgroundColor: colorAppbar,
// elevation: 7,
// duration: Duration(seconds: 1),
// );
// ScaffoldMessenger.of(context)
//     .showSnackBar(snackBar);
// cart.addTotalPrice(
// double.parse(productPrice[index].toString()));
// cart.addCounter();
// }).onError((error, stackTrace) {
// final snackBar = SnackBar(
// content: Row(
// children: [
// Text(
// "Product Already Exists in the Cart",
// style: GoogleFonts.aBeeZee(
// fontSize: 15,
// fontWeight: FontWeight.bold),
// ),
// SizedBox(
// width: 10,
// ),
// Icon(
// Icons.warning,
// color: Colors.white,
// size: 20,
// )
// ],
// ),
// behavior: SnackBarBehavior.floating,
// margin: EdgeInsets.all(15),
// backgroundColor: colorAppbar,
// elevation: 7,
// duration: Duration(seconds: 1),
// );
// ScaffoldMessenger.of(context)
//     .showSnackBar(snackBar);
// print(error.toString());
// });
// },
// child: Container(
// height: 35,
// width: 100,
// decoration: BoxDecoration(
// color: buttonColors,
// borderRadius: BorderRadius.circular(12),
// ),
// child: Center(
// child: Text(
// "Add",
// style: TextStyle(
// color: Colors.white,
// fontWeight: FontWeight.bold),
// ),
// ),
// ),
// ),
// ],
// ),
// );
// },
// ),
