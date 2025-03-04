import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_screen/home_screen.dart';

class Phonepayverifiedpage extends StatefulWidget {
  const Phonepayverifiedpage({super.key});

  @override
  State createState() => _PaymentVerifiedPageState();
}

class _PaymentVerifiedPageState extends State<Phonepayverifiedpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: GestureDetector(
          onTap: () {
            home = true;
            wishlist = true;
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              ModalRoute.withName(''),
            );
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(
          top: (MediaQuery.of(context).size.height / 2) - 160,
          left: (MediaQuery.of(context).size.width / 2) - 120,
        ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              size: 100,
              color: Colors.white,
            ),
            const SizedBox(height: 20),
            Text('Payment Successful!',
                style: GoogleFonts.quicksand(
                  fontSize: 25,
                )),
          ],
        ),
      ),
    );
  }

}
