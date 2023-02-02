import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/Provider/cartProvider.dart';
import 'package:restaurant/constants/colors.dart';
import 'package:restaurant/pages/SuccessPage.dart';

import '../Model/cart_model.dart';
import '../db/db.dart';

// class cartPage extends StatefulWidget {
//   const cartPage({Key? key}) : super(key: key);
//
//   @override
//   State<cartPage> createState() => _cartPageState();
// }
//
// class _cartPageState extends State<cartPage> {
//   int breadvalue = 25;
//   int bunvalue = 15;
//   int totalvalue = 0;
//   int? newvalue;
//   int? bunnewvalue;
//   int quantity = 0;
//   int bunQuantity = 0;
//   int? totalValue;
//
//   @override
//   void initState() {
//     newvalue = 0;
//     bunnewvalue = 0;
//     totalValue = 0;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Cart", style: GoogleFonts.aleo(letterSpacing: 3)),
//         centerTitle: true,
//         backgroundColor: colorAppbar,
//         elevation: 0,
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(15),
//               bottomRight: Radius.circular(15),
//             ),
//           ),
//         ),
//       ),
//       body: ListView(
//         children: [
//           SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       "Order List",
//                       style: GoogleFonts.aleo(
//                         letterSpacing: 3,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       height: 100,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.grey,
//                               spreadRadius: 3,
//                               blurRadius: 10,
//                               offset: Offset(0, 3)),
//                         ],
//                       ),
//                       child: Row(
//                         children: [
//                           Container(
//                             child: Image.asset(
//                               "assets/images/Bread.png",
//                               height: 80,
//                               width: 100,
//                             ),
//                           ),
//                           Container(
//                             width: 190,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "Bread",
//                                   style: TextStyle(fontSize: 20),
//                                 ),
//                                 Text(
//                                   "The Best Quality",
//                                   style: TextStyle(fontSize: 15),
//                                 ),
//                                 Text(
//                                   "\$ 25",
//                                   style: TextStyle(
//                                       fontSize: 18, color: Colors.red),
//                                 )
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.symmetric(vertical: 8),
//                             child: Container(
//                               padding: EdgeInsets.all(5),
//                               decoration: BoxDecoration(
//                                 color: buttonColors,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   GestureDetector(
//                                     onTap: () {
//                                       setState(() {
//                                         newvalue = breadvalue +
//                                             (quantity * breadvalue);
//                                         quantity++;
//                                         totalValue = (newvalue! + bunnewvalue!);
//                                       });
//                                     },
//                                     child: Icon(
//                                       Icons.arrow_drop_up,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   Text(
//                                     quantity.toString(),
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                   GestureDetector(
//                                     onTap: () {
//                                       setState(() {
//                                         if (quantity != 0) {
//                                           newvalue = (--quantity) * breadvalue;
//                                           totalValue =
//                                               (newvalue! - bunnewvalue!);
//                                         } else {}
//                                       });
//                                     },
//                                     child: Icon(
//                                       Icons.arrow_drop_down_sharp,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       height: 100,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.grey,
//                               spreadRadius: 3,
//                               blurRadius: 10,
//                               offset: Offset(0, 3)),
//                         ],
//                       ),
//                       child: Row(
//                         children: [
//                           Container(
//                             child: Image.asset(
//                               "assets/images/Bun.png",
//                               height: 80,
//                               width: 100,
//                             ),
//                           ),
//                           Container(
//                             width: 190,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "Bun",
//                                   style: TextStyle(fontSize: 20),
//                                 ),
//                                 Text(
//                                   "The Best Quality",
//                                   style: TextStyle(fontSize: 15),
//                                 ),
//                                 Text(
//                                   "\$15",
//                                   style: TextStyle(
//                                       fontSize: 18, color: Colors.red),
//                                 )
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.symmetric(vertical: 8),
//                             child: Container(
//                               padding: EdgeInsets.all(5),
//                               decoration: BoxDecoration(
//                                 color: buttonColors,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   GestureDetector(
//                                     onTap: () {
//                                       setState(() {
//                                         bunnewvalue =
//                                             bunvalue + (bunQuantity * bunvalue);
//                                         bunQuantity++;
//
//                                         totalValue = (newvalue! + bunnewvalue!);
//                                       });
//                                     },
//                                     child: Icon(
//                                       Icons.arrow_drop_up,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   Text(
//                                     bunQuantity.toString(),
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                   GestureDetector(
//                                     onTap: () {
//                                       setState(() {
//                                         if (bunQuantity != 0) {
//                                           bunnewvalue =
//                                               (--bunQuantity) * bunvalue;
//                                           totalValue =
//                                               (bunnewvalue! - newvalue!);
//                                         } else {}
//                                       });
//                                     },
//                                     child: Icon(
//                                       Icons.arrow_drop_down_sharp,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   // Padding(
//                   //   padding: const EdgeInsets.all(8.0),
//                   //   child: Container(
//                   //     height: 100,
//                   //     decoration: BoxDecoration(
//                   //       color: Colors.white,
//                   //       borderRadius: BorderRadius.circular(10),
//                   //       boxShadow: [
//                   //         BoxShadow(
//                   //             color: Colors.grey,
//                   //             spreadRadius: 3,
//                   //             blurRadius: 10,
//                   //             offset: Offset(0, 3)),
//                   //       ],
//                   //     ),
//                   //     child: Row(
//                   //       children: [
//                   //         Container(
//                   //           child: Image.asset(
//                   //             "assets/images/Cake.png",
//                   //             height: 80,
//                   //             width: 100,
//                   //           ),
//                   //         ),
//                   //         Container(
//                   //           width: 190,
//                   //           child: Column(
//                   //             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   //             crossAxisAlignment: CrossAxisAlignment.start,
//                   //             children: [
//                   //               Text(
//                   //                 "Cake",
//                   //                 style: TextStyle(fontSize: 20),
//                   //               ),
//                   //               Text(
//                   //                 "The Best Quality",
//                   //                 style: TextStyle(fontSize: 15),
//                   //               ),
//                   //               Text(
//                   //                 "\$20",
//                   //                 style: TextStyle(
//                   //                     fontSize: 18, color: Colors.red),
//                   //               )
//                   //             ],
//                   //           ),
//                   //         ),
//                   //         Padding(
//                   //           padding: EdgeInsets.symmetric(vertical: 8),
//                   //           child: Container(
//                   //             padding: EdgeInsets.all(5),
//                   //             decoration: BoxDecoration(
//                   //               color: Colors.red,
//                   //               borderRadius: BorderRadius.circular(10),
//                   //             ),
//                   //             child: Column(
//                   //               mainAxisAlignment:
//                   //                   MainAxisAlignment.spaceBetween,
//                   //               children: [
//                   //                 Icon(
//                   //                   Icons.arrow_drop_up,
//                   //                   color: Colors.white,
//                   //                 ),
//                   //                 Text(
//                   //                   "2",
//                   //                   style: TextStyle(color: Colors.white),
//                   //                 ),
//                   //                 Icon(
//                   //                   Icons.arrow_drop_down_sharp,
//                   //                   color: Colors.white,
//                   //                 ),
//                   //               ],
//                   //             ),
//                   //           ),
//                   //         )
//                   //       ],
//                   //     ),
//                   //   ),
//                   // ),
//                   // Padding(
//                   //   padding: const EdgeInsets.all(8.0),
//                   //   child: Container(
//                   //     height: 100,
//                   //     decoration: BoxDecoration(
//                   //       color: Colors.white,
//                   //       borderRadius: BorderRadius.circular(10),
//                   //       boxShadow: [
//                   //         BoxShadow(
//                   //             color: Colors.grey,
//                   //             spreadRadius: 3,
//                   //             blurRadius: 10,
//                   //             offset: Offset(0, 3)),
//                   //       ],
//                   //     ),
//                   //     child: Row(
//                   //       children: [
//                   //         Container(
//                   //           child: Image.asset(
//                   //             "assets/images/Rice.png",
//                   //             height: 80,
//                   //             width: 100,
//                   //           ),
//                   //         ),
//                   //         Container(
//                   //           width: 190,
//                   //           child: Column(
//                   //             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   //             crossAxisAlignment: CrossAxisAlignment.start,
//                   //             children: [
//                   //               Text(
//                   //                 "Rice",
//                   //                 style: TextStyle(fontSize: 20),
//                   //               ),
//                   //               Text(
//                   //                 "The Best Quality",
//                   //                 style: TextStyle(fontSize: 15),
//                   //               ),
//                   //               Text(
//                   //                 "\$20",
//                   //                 style: TextStyle(
//                   //                     fontSize: 18, color: Colors.red),
//                   //               )
//                   //             ],
//                   //           ),
//                   //         ),
//                   //         Padding(
//                   //           padding: EdgeInsets.symmetric(vertical: 8),
//                   //           child: Container(
//                   //             padding: EdgeInsets.all(5),
//                   //             decoration: BoxDecoration(
//                   //               color: Colors.red,
//                   //               borderRadius: BorderRadius.circular(10),
//                   //             ),
//                   //             child: Column(
//                   //               mainAxisAlignment:
//                   //                   MainAxisAlignment.spaceBetween,
//                   //               children: [
//                   //                 Icon(
//                   //                   Icons.arrow_drop_up,
//                   //                   color: Colors.white,
//                   //                 ),
//                   //                 Text(
//                   //                   "2",
//                   //                   style: TextStyle(color: Colors.white),
//                   //                 ),
//                   //                 Icon(
//                   //                   Icons.arrow_drop_down_sharp,
//                   //                   color: Colors.white,
//                   //                 ),
//                   //               ],
//                   //             ),
//                   //           ),
//                   //         ),
//                   //       ],
//                   //     ),
//                   //   ),
//                   // ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//                     child: Container(
//                       padding: EdgeInsets.all(20),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.grey,
//                               spreadRadius: 3,
//                               blurRadius: 10,
//                               offset: Offset(0, 3))
//                         ],
//                       ),
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.symmetric(vertical: 10),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   "Total Items",
//                                   style: TextStyle(fontSize: 18),
//                                 ),
//                                 Text(
//                                   "2",
//                                   style: TextStyle(fontSize: 20),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Divider(
//                             color: Colors.black,
//                           ),
//                           Padding(
//                             padding: EdgeInsets.symmetric(vertical: 10),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   "Bread",
//                                   style: TextStyle(fontSize: 18),
//                                 ),
//                                 Text(
//                                   "\$$newvalue",
//                                   style: TextStyle(fontSize: 18),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.symmetric(vertical: 10),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   "Bun",
//                                   style: TextStyle(fontSize: 18),
//                                 ),
//                                 Text(
//                                   "\$$bunnewvalue",
//                                   style: TextStyle(fontSize: 18),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           // Padding(
//                           //   padding: EdgeInsets.symmetric(vertical: 10),
//                           //   child: Row(
//                           //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           //     children: [
//                           //       Text(
//                           //         "Cake",
//                           //         style: TextStyle(fontSize: 18),
//                           //       ),
//                           //       Text(
//                           //         "\$20",
//                           //         style: TextStyle(fontSize: 18),
//                           //       ),
//                           //     ],
//                           //   ),
//                           // ),
//                           // Padding(
//                           //   padding: EdgeInsets.symmetric(vertical: 10),
//                           //   child: Row(
//                           //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           //     children: [
//                           //       Text(
//                           //         "Rice",
//                           //         style: TextStyle(fontSize: 18),
//                           //       ),
//                           //       Text(
//                           //         "\$20",
//                           //         style: TextStyle(fontSize: 18),
//                           //       ),
//                           //     ],
//                           //   ),
//                           // ),
//                           Divider(
//                             color: Colors.black,
//                           ),
//                           Padding(
//                             padding: EdgeInsets.symmetric(vertical: 10),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   "Total",
//                                   style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 Text(
//                                   "\$$totalValue",
//                                   style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.red),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 20),
//           height: 70,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   Text(
//                     "Total:",
//                     style: TextStyle(
//                       fontSize: 19,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text(
//                     "\$$totalValue",
//                     style: TextStyle(
//                       fontSize: 19,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.red,
//                     ),
//                   )
//                 ],
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => SuccessPage(),
//                     ),
//                   );
//                 },
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStatePropertyAll(buttonColors),
//                   padding: MaterialStatePropertyAll(
//                     EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//                   ),
//                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                 ),
//                 child: Text(
//                   "Save Items",
//                   style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class cartScreen extends StatefulWidget {
  const cartScreen({Key? key}) : super(key: key);

  @override
  State<cartScreen> createState() => _cartScreenState();
}

class _cartScreenState extends State<cartScreen> {
  DBHelper? dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart", style: GoogleFonts.aleo(letterSpacing: 3)),
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
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: cart.getData(),
            builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return Center(
                    child: Text("No Data Available"),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image(
                                      height: 100,
                                      width: 100,
                                      image: NetworkImage(
                                        snapshot.data![index].image.toString(),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                snapshot
                                                    .data![index].productName
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  dbHelper!.delete(snapshot
                                                      .data![index].id!);
                                                  cart.removeCounter();
                                                  cart.removeTotalPrice(
                                                      double.parse(snapshot
                                                          .data![index]
                                                          .productPrice
                                                          .toString()));
                                                },
                                                icon: Icon(Icons.delete),
                                              )
                                            ],
                                          ),
                                          Text(
                                            "\$" +
                                                snapshot
                                                    .data![index].productPrice
                                                    .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Colors.red),
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: InkWell(
                                              onTap: () {},
                                              child: Container(
                                                  height: 35,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        InkWell(
                                                            onTap: () {
                                                              int quantity =
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .quantity!;
                                                              int price = snapshot
                                                                  .data![index]
                                                                  .initialPrice!;
                                                              quantity--;
                                                              int? newprice =
                                                                  price *
                                                                      quantity;

                                                              if (quantity >
                                                                  0) {
                                                                dbHelper!
                                                                    .updateQuantity(Cart(
                                                                        id: snapshot
                                                                            .data![
                                                                                index]
                                                                            .id,
                                                                        productId: snapshot
                                                                            .data![
                                                                                index]
                                                                            .id
                                                                            .toString(),
                                                                        productName: snapshot
                                                                            .data![
                                                                                index]
                                                                            .productName,
                                                                        initialPrice: snapshot
                                                                            .data![
                                                                                index]
                                                                            .initialPrice!,
                                                                        productPrice:
                                                                            newprice,
                                                                        quantity:
                                                                            quantity,
                                                                        image: snapshot
                                                                            .data![
                                                                                index]
                                                                            .image
                                                                            .toString()))
                                                                    .then(
                                                                        (value) {
                                                                  newprice = 0;
                                                                  quantity = 0;
                                                                  cart.removeTotalPrice(double.parse(snapshot
                                                                      .data![
                                                                          index]
                                                                      .initialPrice
                                                                      .toString()));
                                                                }).onError((error,
                                                                        stackTrace) {
                                                                  print(error
                                                                      .toString());
                                                                });
                                                              }
                                                            },
                                                            child: Icon(
                                                                Icons.remove)),
                                                        Text(snapshot
                                                            .data![index]
                                                            .quantity
                                                            .toString()),
                                                        InkWell(
                                                            onTap: () {
                                                              int quantity =
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .quantity!;
                                                              int price = snapshot
                                                                  .data![index]
                                                                  .initialPrice!;
                                                              quantity++;
                                                              int? newprice =
                                                                  price *
                                                                      quantity;

                                                              dbHelper!
                                                                  .updateQuantity(Cart(
                                                                      id: snapshot
                                                                          .data![
                                                                              index]
                                                                          .id,
                                                                      productId: snapshot
                                                                          .data![
                                                                              index]
                                                                          .id
                                                                          .toString(),
                                                                      productName: snapshot
                                                                          .data![
                                                                              index]
                                                                          .productName,
                                                                      initialPrice: snapshot
                                                                          .data![
                                                                              index]
                                                                          .initialPrice!,
                                                                      productPrice:
                                                                          newprice,
                                                                      quantity:
                                                                          quantity,
                                                                      image: snapshot
                                                                          .data![
                                                                              index]
                                                                          .image
                                                                          .toString()))
                                                                  .then(
                                                                      (value) {
                                                                newprice = 0;
                                                                quantity = 0;
                                                                cart.addTotalPrice(
                                                                    double.parse(snapshot
                                                                        .data![
                                                                            index]
                                                                        .initialPrice
                                                                        .toString()));
                                                              }).onError((error,
                                                                      stackTrace) {
                                                                print(error
                                                                    .toString());
                                                              });
                                                            },
                                                            child:
                                                                Icon(Icons.add))
                                                      ],
                                                    ),
                                                  )),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              }
              return Text("data");
            },
          ),
          Consumer<CartProvider>(
            builder: (context, value, child) {
              return Visibility(
                visible: value.getTotalPrice().toStringAsFixed(2) == "0.00"
                    ? false
                    : true,
                child: Column(
                  children: [
                    updatePageWidget(
                      title: "Total",
                      value: r'$' + value.getTotalPrice().toStringAsFixed(2),
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class updatePageWidget extends StatelessWidget {
  final String title, value;
  const updatePageWidget({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 16)),
          Text(value.toString())
        ],
      ),
    );
  }
}
