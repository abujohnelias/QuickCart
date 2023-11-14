import 'package:flutter/material.dart';
import 'package:quickcart/model/products.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    Product(
        name: "Converse Chuck Taylor All Star",
        price: 4299.00,
        description:
            "Iconic Converse Chuck Taylor All Star shoes feature a canvas upper, classic rubber toe cap, and a timeless high-top design. Renowned for their versatility and comfort, they embody casual style.",
        imagePath:
            "https://images.unsplash.com/photo-1607522370275-f14206abe5d3?q=80&w=2021&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        productid: '',
        categoryid: ''),
    Product(
        name: "Nike Air Jordan 1",
        price: 11495.00,
        description:
            "The Nike Air Jordan 1 is an iconic basketball shoe designed by Peter Moore for Michael Jordan in 1985. Its timeless high-top silhouette, distinctive swoosh, and bold colorways revolutionized sneaker culture.",
        imagePath:
            "https://images.unsplash.com/photo-1695831440805-1b623520e70e?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        productid: '',
        categoryid: ''),
    Product(
        name: "New Balance 327",
        price: 99,
        description:
            "The New Balance 327 is a retro-inspired sneaker, blending modern design with heritage details. Featuring a lightweight, comfortable build, it boasts a stylish silhouette suitable for both casual and athletic wear.",
        imagePath:
            "https://images.unsplash.com/photo-1680204101489-2c1319c872b2?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        productid: '',
        categoryid: ''),
    Product(
        name: "Nike Air Max",
        price: 6795.00,
        description:
            "Nike Air Max: Iconic athletic shoes featuring visible cushioning, innovative design, and cultural influence. Renowned for comfort, style, and collaborations, they merge sports and fashion seamlessly.",
        imagePath:
            "https://images.unsplash.com/photo-1515955656352-a1fa3ffcd111?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        productid: '',
        categoryid: ''),
    Product(
        name: "Puma Suede",
        price: 6999.00,
        description:
            "Puma Suede, a timeless classic, boasts a sleek suede upper, durable rubber sole, and iconic Formstrip design. Combining style and comfort, it remains a staple in casual fashion and streetwear.",
        imagePath:
            "https://images.unsplash.com/photo-1605034313761-73ea4a0cfbf3?q=80&w=1780&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        productid: '',
        categoryid: '')
  ];

  final List<Product> _cart = [];

  List<Product> get shop => _shop;

  List<Product> get cart => _cart;

  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
