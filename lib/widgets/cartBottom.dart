import 'package:flutter/material.dart';
import 'package:restaurant/pages/invoicePage.dart';

class cartBottomNavbar extends StatefulWidget {
  @override
  State<cartBottomNavbar> createState() => _cartBottomNavbarState();
}

class _cartBottomNavbarState extends State<cartBottomNavbar> {
  int? totalValue;

  @override
  void initState() {
    totalValue = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "Total:",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  totalValue.toString(),
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => invoicePage(),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red),
                padding: MaterialStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              child: Text(
                "Save Items",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
