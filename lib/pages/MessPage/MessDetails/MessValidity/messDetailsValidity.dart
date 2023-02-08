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
            child: Card(
              child: ListTile(
                leading: Text("Linto"),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Start Date:"),
                        Text("10/01/2023"),
                      ],
                    ),
                    Row(
                      children: [
                        Text("End Date: "),
                        Text("10/02/2023"),
                      ],
                    )
                  ],
                ),
                subtitle: Row(
                  children: [
                    Text("Status: "),
                    Text("Completed: "),
                  ],
                ),
                trailing: ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(buttonColors)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => addMessPage()));
                  },
                  icon: Icon(Icons.autorenew),
                  label: Text("Renew"),
                ),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Text("Jubin"),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Start Date:"),
                      Text("08/02/2023"),
                    ],
                  ),
                  Row(
                    children: [
                      Text("End Date: "),
                      Text(" 08/03/2023"),
                    ],
                  )
                ],
              ),
              subtitle: Row(
                children: [
                  Text("Status: "),
                  Text("27 days left"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
