import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/Model/cart_model.dart';
import 'package:restaurant/Provider/cartProvider.dart';
import 'package:restaurant/constants/colors.dart';
import 'package:restaurant/db/db.dart';

class lunchPage extends StatefulWidget {
  const lunchPage({Key? key}) : super(key: key);

  @override
  State<lunchPage> createState() => _lunchPageState();
}

class _lunchPageState extends State<lunchPage> {
  DBHelper? dbHelper = DBHelper();
  List<String> productName = [
    'Biriyani',
    'Kuzhimanthi',
    'Kappa Biriyani',
    'Fried Rice',
    'Rice',
  ];

  List<int> productPrice = [10, 20, 30, 40,50];
  List<String> productImage = [
    'https://res.cloudinary.com/swiggy/image/upload/f_auto,q_auto,fl_lossy/nxmlubuz0b1qixa29gov',
    'https://res.cloudinary.com/swiggy/image/upload/f_auto,q_auto,fl_lossy/oky2o28b1rraeglmyjjy',
    'https://lh4.ggpht.com/_OGMa3JuKVTk/TbUXSyrHuNI/AAAAAAAAGKA/OgfxpqoaeWk/DSC_0209_thumb25.jpg?imgmax=800',
    'https://www.allrecipes.com/thmb/WAaJX7ghFAiGjU3WGRmRC424exA=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/6751001-egg-fried-rice-Mariya-Tkachenko-4x3-1-0a5504e18cea49c2bf4419799bd50ad9.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/d/de/Kerala_oonu.jpg'
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.only(left: 10),
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFFD4E7FE),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.teal,
                ),
              ),
              child: DropdownButton(
                value: value,
                hint: Text("Choose Customer"),
                dropdownColor: Color(0xFFD4E7FE),
                icon: Icon(Icons.arrow_drop_down_outlined),
                iconSize: 25,
                isExpanded: true,
                iconEnabledColor: Colors.teal,
                items: itemz.map(BuildMenuItem).toList(),
                onChanged: (value) => setState(() => this.value = value),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: productName.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 13),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          spreadRadius: 1,
                          blurRadius: 8),
                    ],
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundImage: NetworkImage(
                          productImage[index].toString(),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(productName[index].toString(),
                                style: GoogleFonts.arvo(fontSize: 22)),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "\AED " + productPrice[index].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.red),
                            ),
                          ],
                        ),
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
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
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
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            print(error.toString());
                          });
                        },
                        child: Container(
                          height: 35,
                          width: 100,
                          decoration: BoxDecoration(
                            color: buttonColors,
                            borderRadius: BorderRadius.circular(12),
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
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
