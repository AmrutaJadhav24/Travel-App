import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:home_screen/main.dart";
import "package:home_screen/paymentmethod.dart";
import "package:home_screen/paymentverify.dart";

class PaymentConfirmationPage extends StatefulWidget {
  final String amount;

  const PaymentConfirmationPage({super.key, required this.amount});
  @override
  // ignore: library_private_types_in_public_api
  _PaymentConfirmationPageState createState() =>
      _PaymentConfirmationPageState();
}

String? type;
String? type1;
String? type2;
String? type3;
String? type4;
String? type5;

class _PaymentConfirmationPageState extends State<PaymentConfirmationPage> {
  late final List<TextEditingController> pinControllers;
  late final List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();

    pinControllers = List.generate(6, (_) => TextEditingController());
    focusNodes = List.generate(6, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var controller in pinControllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow("To: ", "Trip Navigator"),
            _buildInfoRow("Sending: ", "${widget.amount}.00"),
            const SizedBox(height: 30),
            Center(
              child: Text(
                "Enter 6-Digit UPI PIN",
                style: GoogleFonts.quicksand(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(6, (index) {
                return SizedBox(
                  width: 40,
                  child: TextField(
                    obscureText: true,
                    controller: pinControllers[index],
                    focusNode: focusNodes[index],
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: const InputDecoration(
                      counterText: " ",
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.phone,
                    maxLength: 1,
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
                      const SnackBar(
                        content: Text(
                          "Please Enter 6 digit password",
                        ),
                        backgroundColor: Colors.red,
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
                        builder: (context) => const PaymentVerifiedPage(),
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

  Widget _buildInfoRow(String label, String value) {
    return Container(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        top: 4.0,
        bottom: 8.0,
      ),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 219, 216, 216),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: GoogleFonts.quicksand(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: const Color.fromARGB(255, 99, 98, 98),
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: GoogleFonts.quicksand(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
