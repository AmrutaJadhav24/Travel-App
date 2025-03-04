import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_screen/loginpage.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State createState() => _ResetPasswordState();
}

String? responseId;

class _ResetPasswordState extends State {
  TextEditingController resetPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void resetConfirm(String reset, String confirm) async {
    if (reset.isEmpty || confirm.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              "Please Enter the password & confirm password to login again"),
          backgroundColor: Colors.red,
        ),
      );
      // resetPasswordController.clear();
      // confirmPasswordController.clear();
    } else {
      reset = reset.trim();
      confirm = confirm.trim();
      if (reset.isEmpty || confirm.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Invalid entry, Please enter valid information",
            ),
            backgroundColor: Colors.red,
          ),
        );
        // resetPasswordController.clear();
        // confirmPasswordController.clear();
      } else if (!confirmPasswordController.text.contains(RegExp(r'[a-z]')) ||
          !confirmPasswordController.text.contains(RegExp(r'[A-Z]')) ||
          !confirmPasswordController.text.contains(RegExp(r'[0-9]')) ||
          !confirmPasswordController.text.contains(RegExp(r'[!-/ && @]')) ||
          confirmPasswordController.text.length < 7) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Password must be greater than 6 including uppercase, lowercase, number & special character",
            ),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        if (reset == confirm) {
          // Collecting data from firebase
          QuerySnapshot response =
              await FirebaseFirestore.instance.collection('SignUpInfo').get();
          for (int i = 0; i < response.docs.length; i++) {
            if (response.docs[i].id == responseId) {
              // Update data from firebase
              await FirebaseFirestore.instance
                  .collection('SignUpInfo')
                  .doc(response.docs[i].id)
                  .update(
                {
                  "password": confirm,
                },
              );
              break;
            }
          }

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Successfully password updated, please remember to login",
              ),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
            ModalRoute.withName(''),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Password not matching, please reEntered password",
              ),
              backgroundColor: Colors.red,
            ),
          );
          confirmPasswordController.clear();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: 460,
            margin: const EdgeInsets.only(right: 25, left: 25, bottom: 40),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(3, 5),
                ),
              ],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.password_sharp,
                  size: 40,
                  color: Color.fromARGB(255, 65, 21, 141),
                ),
                Text(
                  "Get Started",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  '''Enter the password & then confirm the password,
Remember the password for login purpose''',
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  style: GoogleFonts.aBeeZee(),
                  controller: resetPasswordController,
                  decoration: InputDecoration(
                    labelText: "Enter Password",
                    labelStyle: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(
                      Icons.lock,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  style: GoogleFonts.aBeeZee(),
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "ReEntered Password",
                    labelStyle: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(
                      Icons.lock,
                    ),
                    suffixIcon: const Icon(
                      Icons.visibility_off,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    resetConfirm(resetPasswordController.text,
                        confirmPasswordController.text);
                    setState(() {});
                  },
                  child: Container(
                    width: 150,
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 65, 21, 141),
                    ),
                    alignment: const Alignment(0, 0),
                    child: Text(
                      "Continue",
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
