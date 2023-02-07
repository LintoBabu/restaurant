import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/Provider/cartProvider.dart';
import 'package:restaurant/constants/colors.dart';
import 'package:restaurant/pages/salesPage/payment/paymentPage.dart';

import '../../../Model/cart_model.dart';
import '../../../db/db.dart';

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
          decoration: const BoxDecoration(
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
                  return Column(
                    children: [
                      Image.asset("assets/images/cart.png", height: 400),
                    ],
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding:
                              const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          margin:
                              const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    CircleAvatar(
                                      radius: 45,
                                      backgroundImage: NetworkImage(
                                        snapshot.data![index].image.toString(),
                                      ),
                                    ),
                                    const SizedBox(
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
                                                style: GoogleFonts.arvo(
                                                    fontSize: 22),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  final snackBar = SnackBar(
                                                    content: Row(
                                                      children: [
                                                        Text(
                                                          "Item Deleted Successfully",
                                                          style: GoogleFonts
                                                              .aBeeZee(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        const Icon(
                                                          Icons.done,
                                                          color: Colors.white,
                                                          size: 20,
                                                        )
                                                      ],
                                                    ),
                                                    behavior: SnackBarBehavior
                                                        .floating,
                                                    margin: const EdgeInsets.all(15),
                                                    backgroundColor:
                                                        colorAppbar,
                                                    elevation: 7,
                                                    duration:
                                                        const Duration(seconds: 1),
                                                  );
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(snackBar);
                                                  dbHelper!.delete(snapshot
                                                      .data![index].id!);
                                                  cart.removeCounter();
                                                  cart.removeTotalPrice(
                                                      double.parse(snapshot
                                                          .data![index]
                                                          .productPrice
                                                          .toString()));
                                                },
                                                icon: const Icon(Icons.delete),
                                              )
                                            ],
                                          ),
                                          Text(
                                            "AED " +
                                                snapshot
                                                    .data![index].productPrice
                                                    .toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
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
                                                    color: buttonColors,
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

                                                            if (quantity > 0) {
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
                                                                cart.removeTotalPrice(
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
                                                            }
                                                          },
                                                          child: const Icon(
                                                            Icons.remove,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        Text(
                                                          snapshot.data![index]
                                                              .quantity
                                                              .toString(),
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
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
                                                            child: const Icon(
                                                              Icons.add,
                                                              color:
                                                                  Colors.white,
                                                            ))
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
              return const Text("data");
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
                      title: "Total Price :",
                      value: r'AED  ' + value.getTotalPrice().toStringAsFixed(2),
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
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          Text(
            title,
            style: GoogleFonts.arvo(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(value.toString(),
              style: GoogleFonts.arvo(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.red)),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PaymentPage(),
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor: const MaterialStatePropertyAll(buttonColors),
              padding: const MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            child: const Text(
              "Check Out",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
