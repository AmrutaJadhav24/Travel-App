import 'package:flutter/material.dart';
import 'package:home_screen/paymentverify.dart';

class Visapaymentconfirmation extends StatefulWidget {
  final String amount;

  const Visapaymentconfirmation({super.key, required this.amount});

  @override
  State createState() => _PaymentConfirmationPageState();
}

class _PaymentConfirmationPageState extends State<Visapaymentconfirmation> {
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
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 5, right: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 219, 216, 216),
              ),
              child: const Row(
                children: [
                  Text(
                    "To: ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(255, 99, 98, 98),
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Trip Navigator",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 219, 216, 216),
              ),
              child: Row(
                children: [
                  const Text(
                    "Sending: ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(255, 99, 98, 98),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "₹${widget.amount}.00",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
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
                    keyboardType: TextInputType.number, // Numeric input
                    maxLength: 1, // Limit to one digit per text field
                    onChanged: (value) {
                      // When user enters a digit, move to the next field
                      if (value.isNotEmpty && index < 5) {
                        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
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
                onPressed: () {
                  // Navigate to the confirmation page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentVerifiedPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}