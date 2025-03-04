// String amountGPay = "";
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_screen/gpayinfo.dart';
import 'package:home_screen/phonepay.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State createState() => _PaymentMethodState();
}

String amountGPay = "";
String phoneOrGpay = "";

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Payment Method',
          style: GoogleFonts.quicksand(
            textStyle: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 65, 21, 141),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                phoneOrGpay = "assets/images/gpay.jpg";
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const GPayInfoPage()),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(8),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(3, 5),
                    ),
                  ],
                ),

                // height: 80,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(70),
                      child: Image.asset(
                        "assets/images/gpay.jpg",
                        height: 70,
                        width: 70,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "GPay",
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                phoneOrGpay = "assets/images/phonepay.jpg";
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const Phonepayinfopage()),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(3, 5),
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(70),
                      child: Image.asset(
                        "assets/images/phonepay.jpg",
                        height: 70,
                        width: 70,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "PhonePe",
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
