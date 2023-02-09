import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/pages/MessPage/addMess.dart';

import '../../../../constants/colors.dart';

class messDetailsPackage extends StatefulWidget {
  const messDetailsPackage({Key? key}) : super(key: key);

  @override
  State<messDetailsPackage> createState() => _messDetailsPackageState();
}

class _messDetailsPackageState extends State<messDetailsPackage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("MESS DATA", style: GoogleFonts.aleo(letterSpacing: 3)),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      listreturn(
                        "Customer Name",
                        "JUBIN",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      listreturn("Mess Start Date", "10/01/2023"),
                      SizedBox(
                        height: 10,
                      ),
                      listreturn("Mess End Date", "10/02/2023"),
                      SizedBox(
                        height: 10,
                      ),
                      listreturn("Status", "Completed"),
                      Row(
                        children: [
                          Spacer(),
                          ElevatedButton.icon(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(buttonColors)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => addMessPage()));
                            },
                            icon: Icon(Icons.autorenew),
                            label: Text("Renew"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      listreturn(
                        "Customer Name",
                        "LINTO",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      listreturn("Mess Start Date", "10/02/2023"),
                      SizedBox(
                        height: 10,
                      ),
                      listreturn("Mess End Date", "10/03/2023"),
                      SizedBox(
                        height: 10,
                      ),
                      listreturn("Status", "21 Days to go"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget listreturn(String text, String value) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            width: 150,
            child: Text(
              text,
              style:
                  GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 18),
            )),
      ),
      Text(
        ': ',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        width: 20,
      ),
      Expanded(
        child: Text(
          value,
          style: GoogleFonts.lato(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    ],
  );
}
