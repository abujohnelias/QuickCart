import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quickcart/components/my_button.dart';
import 'package:quickcart/model/products.dart';
import 'package:quickcart/model/shop.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  // final cart = context.watch<Shop>();

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    double totalAmount =
        cart.fold(0, (previous, current) => previous + current.price);
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.arrow_back_ios_rounded),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Cart Page", style: GoogleFonts.poppins()),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(children: [
        Expanded(
            child: cart.isEmpty
                ? Center(
                    child: Text(
                    "Your cart is empty...",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];
                      return Container(
                        // padding: const EdgeInsets.only(
                        //   left:15,right: 5),
                        padding: EdgeInsets.all(5),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(15)),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Stack(
                          children: [
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.115,
                              width: double.infinity,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Image.network(item.imagePath,
                                  fit: BoxFit.cover),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  )),
                            ),
                            ListTile(
                              tileColor: null,
                              title: Text(
                                item.name,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.045,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
                              ),
                              subtitle: Text(
                                item.price.toStringAsFixed(2),
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.03,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
                              ),
                              trailing: IconButton(
                                  onPressed: () =>
                                      removeItemFromCart(context, item),
                                  icon: const Icon(
                                    Icons.highlight_remove_rounded,
                                    color: Colors.red,
                                  )),
                            ),
                          ],
                        ),
                      );
                    },
                  )),
        cart.isEmpty
            ? Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.width * 0.05,
                  top: MediaQuery.of(context).size.width * 0.05,
                ),
                child: MyButton(
                  child: Text(
                    "Go to home",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      fontSize: MediaQuery.of(context).size.width * 0.03,
                      // color: Theme.of(context).colorScheme.,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/shop_page');
                  },
                ),
              )
            : Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.width * 0.05,
                  top: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "Total: \$${totalAmount.toStringAsFixed(2)}", // Display total cart amount
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w300,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: Theme.of(context).colorScheme.onBackground,
                          )),
                      MyButton(
                        child: Text(
                          "Pay Now",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w300,
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                            // color: Theme.of(context).colorScheme.,
                          ),
                        ),
                        onTap: () => payButtonPressed(context),
                      ),
                    ],
                  ),
                ),
              ),
      ]),
    );
  }

  removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: Text("Remove this item from your cart?",
            style: GoogleFonts.poppins()),
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
                  context.read<Shop>().removeFromCart(product);

                  // Show Snackbar
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      
                      duration: const Duration(milliseconds: 210),
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      content: Text(
                        'Item removed...',
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

  payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
         elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: Text("Sorry...We are working on it",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w300,
              fontSize: MediaQuery.of(context).size.width * 0.05,
              color: Theme.of(context).colorScheme.inversePrimary,
            )),
      ),
    );
  }
}
