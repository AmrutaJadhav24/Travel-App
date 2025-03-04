import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_screen/main.dart';
import 'package:home_screen/payment_confirmed.dart';
import 'package:home_screen/paymentmethod.dart';
import 'package:home_screen/phonepayverify.dart';

class PhonePayConfirmationPage extends StatefulWidget {
  final String amount;

  const PhonePayConfirmationPage({super.key, required this.amount});

  @override
  State createState() => _PaymentConfirmationPageState();
}

class _PaymentConfirmationPageState extends State<PhonePayConfirmationPage> {
  late List<TextEditingController> pinControllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    // Initialize the controllers and focus nodes
    pinControllers = List.generate(6, (index) => TextEditingController());
    focusNodes = List.generate(6, (index) => FocusNode());
  }

  @override
  void dispose() {
    // Dispose of the controllers and focus nodes
    for (var controller in pinControllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                top: 8.0,
                bottom: 4.0,
              ),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 219, 216, 216),
              ),
              child: Row(
                children: [
                  Text(
                    "To: ",
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Trip Navigator",
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 219, 216, 216),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  top: 4.0,
                  bottom: 8.0,
                ),
                child: Row(
                  children: [
                    Text(
                      "Sending: ",
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "${widget.amount}.00",
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30), // Add some space before the next text
            const Center(
              child: Text(
                "Enter 6-Digit UPI PIN",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20), // Add some space before the text fields

            // Row for 6 text fields
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(6, (index) {
                return SizedBox(
                  width: 40, // Width for each text field
                  child: TextField(
                    controller: pinControllers[index],
                    focusNode: focusNodes[index], // Assign the focus node
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: const InputDecoration(
                      counterText: " ",
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    textAlign: TextAlign.center, // Center the text
                    keyboardType: TextInputType.phone,
                    obscureText: true, // Numeric input
                    maxLength: 1, // Limit to one digit per text field
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 5) {
                        FocusScope.of(context)
                            .requestFocus(focusNodes[index + 1]);
                      } else if (value.isEmpty && index > 0) {
                        FocusScope.of(context)
                            .requestFocus(focusNodes[index - 1]);
                      }
                    },
                  ),
                );
              }),
            ),

            const Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.verified, size: 60, color: Colors.green),
                onPressed: () async {
                  bool allFilled = pinControllers.every(
                      (controller) => controller.text.trim().length == 1);

                  if (!allFilled) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.grey,
                        content: Text(
                          "Please enter 6-digits UPI Pin",
                          style: GoogleFonts.quicksand(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    );
                    FocusScope.of(context).requestFocus(focusNodes[0]);
                  } else {
                    await FirebaseFirestore.instance
                        .collection('PackageBooking')
                        .add({
                      'username': userInformation[0]['username'],
                      'dest': type2,
                      'port': type3,
                      'date': type4,
                      'name': type5,
                      'image': phoneOrGpay,
                      'type': type,
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Phonepayverifiedpage(),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
