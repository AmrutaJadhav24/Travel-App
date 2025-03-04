import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_screen/main.dart';
import 'package:home_screen/paymentmethod.dart';
import 'package:home_screen/phonepayconfirmed.dart';

class Phonepayinfopage extends StatefulWidget {
  const Phonepayinfopage({super.key});

  @override
  State<Phonepayinfopage> createState() => _GPayInfoPageState();
}

class _GPayInfoPageState extends State<Phonepayinfopage> {
  final TextEditingController amountController = TextEditingController();

  void _showBottomSheet() {
    String enteredAmount = amountGPay;

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: const Color.fromARGB(255, 61, 61, 61),
      builder: (context) { 
        String number = userInformation[0]['mobileNo'];
        String no = '';
        for(int i=6 ; i<number.length; i++){
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
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 20),
              Text(
                "State Bank of India",
                style: GoogleFonts.quicksand(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                "......$no",
                style: GoogleFonts.quicksand(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Color.fromARGB(255, 81, 158, 221),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PhonePayConfirmationPage(
                          amount: enteredAmount,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    "Pay $enteredAmount",
                    style: GoogleFonts.quicksand(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.black,
          padding: const EdgeInsets.only(top: 10),
          height: MediaQuery.of(context).size.height - 100,
          child: Column(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  color: Colors.purple,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "T",
                    style: GoogleFonts.quicksand(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Paying to trip navigator bank account",
                style: GoogleFonts.quicksand(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
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
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                "+91 ${userInformation[0]['mobileNo']}",
                style: GoogleFonts.quicksand(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const Icon(
                  //   Icons.currency_rupee,
                  //   size: 35,
                  //   color: Colors.white, // Set the rupee icon color to white
                  // ),
                  // const SizedBox(width: 5),
                  Text(
                    amountGPay,
                    style: GoogleFonts.quicksand(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 115),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 104, 101, 101),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Add a note",
                      hintStyle: GoogleFonts.quicksand(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              // const SizedBox(height: 100),
              const Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_forward,
                        size: 35,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        _showBottomSheet();
                        // if (amountController.text.trim() == '') {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(
                        //         content: Text(
                        //       "Amount can't be less than ₹1",
                        //       style: GoogleFonts.quicksand(
                        //         color: Colors.red,
                        //         fontWeight: FontWeight.bold,
                        //         fontSize: 20,
                        //       ),

                        //     ),
                        //     backgroundColor: Colors.white,
                        //     ),
                        //   );
                        // }else{
                        // _showBottomSheet();
                        // }
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
