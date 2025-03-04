import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'reset_password.dart';
import 'sign_up.dart';

import 'main.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State createState() => _ForgotPasswordState();
}

String? emailUser;

class _ForgotPasswordState extends State {
  TextEditingController emailController = TextEditingController();

  Future<void> checkExisting() async {
    emailUser = emailController.text;
    if (emailUser!.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please Enter valid Email"),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      if (userInformation.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                "Email Address doesn't exist, Please firstly sign up an account"),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        // Getting Data from Firebase
        QuerySnapshot response =
            await FirebaseFirestore.instance.collection('SignUpInfo').get();

        for (int i = 0; i < response.docs.length; i++) {
          if (response.docs[i]['email'] == emailController.text) {
            responseId = response.docs[i].id;
            break;
          }
        }

        for (int i = 0; i < userInformation.length; i++) {
          if (userInformation[i]["email"] == emailUser) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("You can reset your password"),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ResetPassword(),
              ),
            );
            break;
          }
          if (i == (userInformation.length - 1)) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                    "Email Address doesn't exist, Please firstly sign up an account or fill correct detail"),
                backgroundColor: Colors.red,
              ),
            );
          }
        }
      }
    }
    emailController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          height: 370,
          margin: const EdgeInsets.only(
            right: 25,
            left: 25,
            bottom: 40,
          ),
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
                Icons.travel_explore,
                size: 40,
                color: Color.fromARGB(255, 65, 21, 141),
              ),
              Text(
                "Forgot your Password ?",
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                "Enter your email & we'll help you to reset your password",
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
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Enter Email ",
                  labelStyle: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  fillColor: const Color.fromARGB(255, 206, 205, 205),
                  filled: true,
                ),
              ),
              GestureDetector(
                onTap: () {
                  checkExisting();
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
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const SignUp(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: GoogleFonts.quicksand(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Sign Up",
                      style: GoogleFonts.quicksand(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 65, 21, 141),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
