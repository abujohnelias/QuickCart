import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quickcart/components/my_button.dart';
import 'package:quickcart/model/products.dart';
import 'package:quickcart/model/shop.dart';
import 'package:quickcart/view/cart_page.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.015),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, .5),
              ),
            ],
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(15)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        width: double.infinity,
                        // padding: EdgeInsets.all(
                        //     MediaQuery.of(context).size.width * 0.05),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        child: Image.network(
                          product.imagePath,
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Text(product.name,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.045,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    product.description,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      fontSize: MediaQuery.of(context).size.width * 0.035,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.02,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    " ₹ ${product.price.toStringAsFixed(2)}",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: MediaQuery.of(context).size.width * 0.035,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(8)),
                      child: IconButton(
                          onPressed: () => addToCart(context),
                          icon: const Icon(
                            Icons.add,
                            color: Colors.red,
                          )))
                ],
              )
            ]),
      ),
    );
  }

  addToCart(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: Text(
          "Add this item to your cart?",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w300,
            fontSize: MediaQuery.of(context).size.width * 0.035,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.clear_rounded, color: Colors.red[200]),
              ),
              //confirm
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);

                  //add to cart
                  context.read<Shop>().addToCart(product);

                  // Show Snackbar
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(milliseconds: 210),
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      content: Text(
                        'Item added...',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w300,
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ),
                  );
                },
                child: Icon(Icons.check_rounded, color: Colors.green[200]),
              )
            ],
          )
          //cancel
        ],
      ),
    );
  }
}
