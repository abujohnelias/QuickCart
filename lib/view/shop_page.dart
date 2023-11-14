import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quickcart/components/my_drawer.dart';
import 'package:quickcart/components/my_product_tile.dart';
// import 'package:quickcart/model/products.dart';
import 'package:quickcart/model/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          // leading:  Icon(Icons.arrow_back_ios_new_rounded),
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("", style: GoogleFonts.poppins()),
          actions: [
            IconButton(
                onPressed: () => Navigator.pushNamed(context, '/cart_page'),
                icon: const Icon(Icons.shopping_cart_outlined))
          ],
        ),
        drawer: const MyDrawer(),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 4),
              child: Text(
                "Shop",
                style: GoogleFonts.almarai(
                  fontWeight: FontWeight.w800,
                  fontSize: MediaQuery.of(context).size.width * 0.07,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
            //
            Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: MediaQuery.of(context).size.width * 0.035,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    children: const [
                      TextSpan(text: "Pick from a "),
                      TextSpan(
                        text: "selected",
                        style: TextStyle(color: Colors.red),
                      ),
                      TextSpan(text: " list of premium files"),
                    ],
                  ),
                )),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return MyProductTile(product: product);
                },
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.035),
            //   child: const Center(child: Text("data")),
            // )
          ],
        ));
  }
}
