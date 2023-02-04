import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/pages/SuccessPage.dart';

import '../constants/colors.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

enum Payment { cash, credit, card }

class _PaymentPageState extends State<PaymentPage> {
  TextEditingController cashcontroller = TextEditingController();

  int value = 0;

  Payment? _pay;
  bool _homeFieldVisible = false;

  void handleSelection(Payment? value) {
    setState(() {
      _pay = value;
      _homeFieldVisible = value == Payment.credit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment", style: GoogleFonts.aleo(letterSpacing: 3)),
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
      body: Center(
        child: Column(
          children: [
            Text(
              "Choose your Payment Option",
              style: GoogleFonts.arvo(fontSize: 17, color: Colors.grey),
            ),
            SizedBox(
              height: 25,
            ),
            RadioListTile(
              title: const Text('Credit'),
              value: Payment.cash,
              groupValue: _pay,
              onChanged: handleSelection,
            ),
            RadioListTile(
              title: const Text('Cash'),
              value: Payment.credit,
              groupValue: _pay,
              onChanged: handleSelection,
            ),
            if (_homeFieldVisible)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: cashcontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Your Amount',
                  ),
                ),
              ),
            RadioListTile(
              title: const Text("Card"),
              value: Payment.card,
              groupValue: _pay,
              onChanged: handleSelection,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 18),
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    cashcontroller.clear();
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SuccessPage(),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(buttonColors),
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
                  "PAY",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
