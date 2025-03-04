import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_screen/main.dart';
import 'package:home_screen/payment_confirmed.dart';
import 'package:home_screen/paymentmethod.dart';
// import 'package:trip_navigator2/PaymentConfirmationPage.dart';

class GPayInfoPage extends StatefulWidget {
  const GPayInfoPage({super.key});

  @override
  State<GPayInfoPage> createState() => _GPayInfoPageState();
}

class _GPayInfoPageState extends State<GPayInfoPage> {
  void _showBottomSheet() {
    String enteredAmount = amountGPay;

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        String number = userInformation[0]['mobileNo'];
        String no = '';
        for (int i = 6; i < number.length; i++) {
          no = no + number[i];
        }
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Choose account to pay with",
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "State Bank of India",
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                "......$no",
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                    Color.fromARGB(255, 5, 82, 146),
                  )),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PaymentConfirmationPage(amount: enteredAmount),
                      ),
                    );
                  },
                  child: Text(
                    "Pay $enteredAmount",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  "T",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Paying Trip Navigator Bank Account",
              style: GoogleFonts.quicksand(
                textStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.verified,
                  color: Colors.green,
                  size: 20,
                ),
                const SizedBox(width: 4),
                Text(
                  "Banking name: Trip Navigator",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              "+91 ${userInformation[0]['mobileNo']}",
              style: GoogleFonts.quicksand(
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  amountGPay,
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        fontSize: 35,
                        color: Colors.black,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Add a note",
                    border: InputBorder.none,
                  ),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                // padding: const EdgeInsets.only(right: 20),
                margin: EdgeInsets.only(
                  right: 20,
                  top: (MediaQuery.of(context).size.height / 2) - 120,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_forward,
                    size: 35,
                    color: Colors.white,
                  ),
                  onPressed: _showBottomSheet,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
