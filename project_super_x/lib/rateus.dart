import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_screen/main.dart';
import 'package:home_screen/reviews.dart';
// import 'package:trip_navigator2/SubmissionConfirmationPage.dart';
// import 'package:trip_navigator2/home_screen.dart';

class RateUsApp extends StatefulWidget {
  const RateUsApp({super.key});

  @override
  State<RateUsApp> createState() => RateUsAppState();
}

void addReview() async {
  QuerySnapshot response =
      await FirebaseFirestore.instance.collection('RateUs').get();
  reviewsPage.clear();
  for (int i = 0; i < response.docs.length; i++) {
    reviewsPage.add({
      'name': response.docs[i]['name'],
      'query': response.docs[i]['query'],
      'stars': response.docs[i]['stars'].toString(),
      'feedback': response.docs[i]['feedback']
    });
  }
}

class RateUsAppState extends State<RateUsApp> {
  int selectedStars = 0;
  int selectedContainer = -1;
  String selectedQuery = "";

  TextEditingController feedbackController = TextEditingController();

  void submitFeedback() async {
    if (selectedQuery.isEmpty) {
      selectedQuery = "none";
    }
    if (selectedQuery.isNotEmpty &&
        selectedStars > 0 &&
        feedbackController.text.trim().isNotEmpty) {
      log("in submit fedback");
      await FirebaseFirestore.instance.collection('RateUs').add({
        "name": userInformation[0]['name'],
        "query": selectedQuery,
        "stars": selectedStars,
        "feedback": feedbackController.text,
      });
      print(
          "Feedback submitted: Query: $selectedQuery, Stars: $selectedStars, Feedback: ${feedbackController.text}");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Feedback submitted successfully!",
          ),
          backgroundColor: Colors.green,
        ),
      );
      // Reset the form
      setState(() {
        selectedContainer = -1;
        selectedStars = 0;
        selectedQuery = "";
      });
      feedbackController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please complete all fields before submitting."),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            // addReview();
            addReview();

            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Rate Us",
          style: GoogleFonts.quicksand(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 65, 21, 141),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return IconButton(
                    icon: Icon(
                      Icons.star,
                      color: index < selectedStars ? Colors.amber : Colors.grey,
                      size: 50,
                    ),
                    onPressed: () {
                      setState(() {
                        selectedStars = index + 1;
                      });
                    },
                  );
                }),
              ),
              // const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  top: 20,
                  right: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedContainer = 0;
                          selectedQuery = "Support center";
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          color: selectedContainer == 0
                              ? Colors.amber.shade200
                              : Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Support Center",
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedContainer = 1;
                          selectedQuery = "Delay in refund";
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          color: selectedContainer == 1
                              ? Colors.amber.shade200
                              : Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Delay in refund",
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  top: 20,
                  right: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedContainer = 2;
                          selectedQuery = "Cancellation";
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 22),
                        decoration: BoxDecoration(
                          color: selectedContainer == 2
                              ? Colors.amber.shade200
                              : Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Cancellation",
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedContainer = 3;
                          selectedQuery = "Booking Failure";
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          color: selectedContainer == 3
                              ? Colors.amber.shade200
                              : Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Booking Failure",
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedContainer = 4;
                    selectedQuery = "Nothing";
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 45),
                  decoration: BoxDecoration(
                    color: selectedContainer == 4
                        ? Colors.amber.shade200
                        : Colors.white,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Nothing",
                    style: GoogleFonts.quicksand(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width - 30,
                height: 130,
                child: TextField(
                  controller: feedbackController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Tell us what made you unhappy",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () async {
                  submitFeedback();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 100,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 65, 21, 141),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Submit',
                    style: GoogleFonts.quicksand(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
