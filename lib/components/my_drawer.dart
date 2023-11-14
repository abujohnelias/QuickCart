import 'package:flutter/material.dart';
import 'package:quickcart/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          children: [
            DrawerHeader(
              child: Center(
                child: Icon(
                  Icons.shopping_bag_rounded,
                  size: MediaQuery.of(context).size.width * 0.15,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            MyListTile(
              text: "Shop",
              icon: Icons.home,
              onTap: () => Navigator.pop(context),
            ),
            MyListTile(
              text: "Cart",
              icon: Icons.shopping_cart_rounded,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/cart_page');
              },
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.03),
          child: MyListTile(
            text: "Exit",
            icon: Icons.logout_rounded,
            onTap: () => Navigator.pushNamedAndRemoveUntil(
                context, '/intro_page', (route) => false),
          ),
        ),
      ]),
    );
  }
}
