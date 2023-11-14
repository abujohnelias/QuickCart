import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickcart/model/shop.dart';
import 'package:quickcart/themes/light_mode.dart';
import 'package:quickcart/view/cart_page.dart';
import 'package:quickcart/view/intro_page.dart';
import 'package:quickcart/view/shop_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: lightmode,
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/shop_page': (context) => const ShopPage(),
        '/cart_page': (context) => CartPage(),
      },
    );
  }
}
