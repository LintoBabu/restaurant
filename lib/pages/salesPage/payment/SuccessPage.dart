import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/constants/colors.dart';
import 'package:restaurant/pages/homePage/homePage.dart';

import '../../../Provider/cartProvider.dart';
import '../../../db/db.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  DBHelper? dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage("assets/images/success.gif"),
            height: 150.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "Saved Successfull",
              style: TextStyle(fontSize: 18.0, color: Colors.grey[600]),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(vertical: 24.0),
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  cart.initCounter();
                });

                dbHelper!.deleteAll();
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => homePage(),
                  ),
                );
              },
              child: Text("OK"),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  backgroundColor: MaterialStatePropertyAll(buttonColors)),
            ),
          ),
        ],
      ),
    );
  }
}
