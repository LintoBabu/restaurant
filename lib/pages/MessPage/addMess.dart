import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/pages/MessPage/todayMess.dart';

import '../../constants/colors.dart';
import 'MessDetails/newMessSection.dart';

class addMessPage extends StatefulWidget {
  const addMessPage({Key? key}) : super(key: key);

  @override
  State<addMessPage> createState() => _addMessPageState();
}

class _addMessPageState extends State<addMessPage> {
  DateTime? selectedDate;
  String? selectedDatetype;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(
        () {
          selectedDate = picked;
          selectedDatetype = DateFormat('dd-MM-yyyy').format(selectedDate!);
        },
      );
    }
  }

  bool? isBreakchecked = false;
  bool? islunchchecked = false;
  bool? isDinnerchecked = false;

  final itemz = ['Linto', 'Rahul', 'Jubin', 'Rumaise'];
  final payment = ['Cash', 'Card', 'Credit'];

  String? value;
  String? paymentValue;

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
        title: Text(
          "MESS",
          style: GoogleFonts.aleo(letterSpacing: 3),
        ),
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
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MessSection(),
                    ));
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
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
                    color: Colors.black,
                  ),
                ),
                child: DropdownButton(
                  underline: SizedBox.shrink(),
                  value: value,
                  hint: const Text("Choose Customer"),
                  icon: const Icon(Icons.arrow_drop_down_outlined),
                  iconSize: 25,
                  isExpanded: true,
                  items: itemz.map(BuildMenuItem).toList(),
                  onChanged: (value) => setState(() => this.value = value),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Mess Section",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CheckboxListTile(
              title: Text(
                "Breakfast",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              value: isBreakchecked,
              onChanged: (bool? newValue) {
                setState(() {
                  isBreakchecked = newValue;
                });
              },
              activeColor: Colors.red,
              controlAffinity: ListTileControlAffinity.leading,
            ),
            CheckboxListTile(
              title: Text(
                "Lunch",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              value: islunchchecked,
              onChanged: (bool? newValue) {
                setState(() {
                  islunchchecked = newValue;
                });
              },
              activeColor: Colors.red,
              controlAffinity: ListTileControlAffinity.leading,
            ),
            CheckboxListTile(
              title: Text(
                "Dinner",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              value: isDinnerchecked,
              onChanged: (bool? newValue) {
                setState(() {
                  isDinnerchecked = newValue;
                });
              },
              activeColor: Colors.red,
              controlAffinity: ListTileControlAffinity.leading,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  _selectDate(context);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all()),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        selectedDatetype != null
                            ? selectedDatetype.toString()
                            : 'Choose Date',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Payment Type",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: DropdownButton(
                  underline: SizedBox.shrink(),
                  value: paymentValue,
                  hint: const Text("Choose Payment Type"),
                  icon: const Icon(Icons.arrow_drop_down_outlined),
                  iconSize: 25,
                  isExpanded: true,
                  iconEnabledColor: Colors.teal,
                  items: payment.map(BuildMenuItem).toList(),
                  onChanged: (value) =>
                      setState(() => this.paymentValue = value),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                maxLines: 4,
                minLines: 4,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'Remarks..',
                  hintStyle: const TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(60))),
                width: MediaQuery.of(context).size.width / 1.5,
                height: 45,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton.icon(
                  label: Text(
                    'SUBMIT',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: buttonColors, // foreground
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.save),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
