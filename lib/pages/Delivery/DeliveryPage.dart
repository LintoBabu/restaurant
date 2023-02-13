import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';

class deliveryPage extends StatefulWidget {
  const deliveryPage({Key? key}) : super(key: key);

  @override
  State<deliveryPage> createState() => _deliveryPageState();
}

class _deliveryPageState extends State<deliveryPage> {
  final DeliveryBoys = ['Lenin', 'Raj', 'Sherin'];

  bool? isLintobreakFastchecked = false;
  bool? isLintolunchchecked = false;
  bool? isLintodinnerchecked = false;

  bool? isRahulbreakFastchecked = false;
  bool? isRahullunchchecked = false;
  bool? isRahuldinnerchecked = false;

  bool? isJubinbreakFastchecked = false;
  bool? isJubinlunchchecked = false;
  bool? isJubindinnerchecked = false;

  String? deliveryValue;

  DropdownMenuItem<String> BuildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Delivery Page", style: GoogleFonts.aleo(letterSpacing: 3)),
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
              padding: const EdgeInsets.only(left: 10),
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.teal,
                ),
              ),
              child: DropdownButton(
                underline: SizedBox.shrink(),
                value: deliveryValue,
                hint: const Text("Choose your Name"),
                icon: const Icon(Icons.arrow_drop_down_outlined),
                iconSize: 25,
                isExpanded: true,
                iconEnabledColor: Colors.teal,
                items: DeliveryBoys.map(BuildMenuItem).toList(),
                onChanged: (value) =>
                    setState(() => this.deliveryValue = value),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(columnSpacing: 30.0, columns: [
              const DataColumn(
                label: Text(
                  "Customer",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                numeric: false,
                tooltip: "Customer Name",
              ),
              const DataColumn(
                  label: Text("Breakfast",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  numeric: false,
                  tooltip: "Breakfast"),
              const DataColumn(
                  label: Text("Lunch",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  numeric: false,
                  tooltip: "Lunch"),
              const DataColumn(
                  label: Text("Dinner",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  numeric: false,
                  tooltip: "Lunch"),
            ], rows: [
              DataRow(cells: [
                const DataCell(
                  Text("Linto", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                DataCell(Checkbox(
                    value: isLintobreakFastchecked,
                    onChanged: (newbool) {
                      setState(() {
                        isLintobreakFastchecked = newbool;
                      });
                    })),
                DataCell(
                  Checkbox(
                      value: isLintolunchchecked,
                      onChanged: (newbool) {
                        setState(() {
                          isLintolunchchecked = newbool;
                        });
                      }),
                ),
                DataCell(Checkbox(
                    value: isLintodinnerchecked,
                    onChanged: (newbool) {
                      setState(() {
                        isLintodinnerchecked = newbool;
                      });
                    })),
              ]),
              DataRow(cells: [
                const DataCell(
                  Text("Rahul", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                DataCell(
                  Checkbox(
                      value: isRahulbreakFastchecked,
                      onChanged: (newbool) {
                        setState(() {
                          isRahulbreakFastchecked = newbool;
                        });
                      }),
                ),
                DataCell(
                  Checkbox(
                      value: isRahullunchchecked,
                      onChanged: (newbool) {
                        setState(() {
                          isRahullunchchecked = newbool;
                        });
                      }),
                ),
                DataCell(
                  Checkbox(
                      value: isRahuldinnerchecked,
                      onChanged: (newbool) {
                        setState(() {
                          isRahuldinnerchecked = newbool;
                        });
                      }),
                ),
              ]),
              DataRow(cells: [
                const DataCell(
                  Text("Jubin", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                DataCell(
                  Checkbox(
                      value: isJubinbreakFastchecked,
                      onChanged: (newbool) {
                        setState(() {
                          isJubinbreakFastchecked = newbool;
                        });
                      }),
                ),
                DataCell(
                  Checkbox(
                      value: isJubinlunchchecked,
                      onChanged: (newbool) {
                        setState(() {
                          isJubinlunchchecked = newbool;
                        });
                      }),
                ),
                DataCell(
                  Checkbox(
                      value: isJubindinnerchecked,
                      onChanged: (newbool) {
                        setState(() {
                          isJubindinnerchecked = newbool;
                        });
                      }),
                ),
              ]),
            ]),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(60))),
            width: MediaQuery.of(context).size.width / 1.5,
            height: 40,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton.icon(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(buttonColors),
                ),
                onPressed: () {},
                icon: const Icon(Icons.add_business_outlined),
                label: const Text("SAVE")),
          )
        ],
      ),
    );
  }
}
