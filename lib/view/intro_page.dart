import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickcart/components/my_button.dart';
import 'package:sizer/sizer.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            Icons.shopping_bag_rounded,
            size: MediaQuery.of(context).size.width * 0.15,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Text(
            "QUICKCART",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width * 0.05,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Text(
            "Browse, Pick, Checkout - Quick and Easy!",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w300,
              fontSize: MediaQuery.of(context).size.width * 0.035,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          MyButton(
            onTap: () => Navigator.pushNamed(context, '/shop_page'),
            child: Icon(Icons.arrow_forward_ios_rounded),
          )
        ]),
      ),
    ));
  }
}
