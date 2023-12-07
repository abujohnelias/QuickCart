import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickcart/components/my_button.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  bool isButtonTapped = false;
  bool isFirstTextFieldNotEmpty = false;
  bool isSecondTextFieldNotEmpty = false;
  bool isObscured = true;

  TextEditingController firstTextFieldController = TextEditingController();
  TextEditingController secondTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          //

          //?icon
          Icon(
            Icons.shopping_bag_rounded,
            size: MediaQuery.of(context).size.width * 0.15,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),

          //?text1
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

          //?text2
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

          //?button and text fields
          isButtonTapped

              //?first text field
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(),
                      hintText: 'Username',
                      hintStyle: GoogleFonts.poppins(),
                    ),
                    onChanged: (value1) {
                      setState(() {
                        isFirstTextFieldNotEmpty = value1.isNotEmpty;

                        // Clear data in the second TextField
                        if (!isFirstTextFieldNotEmpty) {
                          secondTextFieldController.clear();
                        }
                      });
                    },
                  ),
                )

              //?very first button
              : MyButton(
                  onTap: () {
                    // Set the state to true when the button is tapped
                    setState(() {
                      isButtonTapped = true;
                    });
                  },
                  child: const Icon(Icons.arrow_forward_ios_rounded),
                ),

          //?second textfield
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: isFirstTextFieldNotEmpty
                  ? TextField(
                      controller: secondTextFieldController,
                      obscureText: isObscured,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(),
                        hintText: 'Password',
                        hintStyle: GoogleFonts.poppins(),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(
                              () {
                                isObscured = !isObscured;
                              },
                            );
                          },
                          child: Icon(
                            isObscured
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                      onChanged: (value2) {
                        setState(() {
                          isSecondTextFieldNotEmpty = value2.isNotEmpty;
                        });
                      },
                    )
                  : null),

          //?second button
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 8,
            ),
            child: SizedBox(
              child: isSecondTextFieldNotEmpty
                  ? MyButton(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Center(
                        child: Text(
                          "Login",
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                      onTap: () =>
                          Navigator.pushReplacementNamed(context, '/shop_page'),
                    )
                  : null,
            ),
          )
        ]),
      ),
    ));
  }
}
