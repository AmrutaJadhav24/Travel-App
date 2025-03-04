import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_screen/main.dart';
import 'package:home_screen/rateus.dart';

class Reviewspage extends StatefulWidget {
  const Reviewspage({super.key});

  @override
  State<Reviewspage> createState() => _ReviewspageState();
}

List<Map<String, dynamic>> reviewsPage = [];

Widget returnBodyReview() {
  if (reviewsPage.isEmpty) {
    return Container(
      alignment: const Alignment(0, 0),
      child: Text(
        "No any Reviews are available",
        style: GoogleFonts.aBeeZee(
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  } else {
    return ListView.builder(
      itemCount: reviewsPage.length,
      itemBuilder: (context, index) {
        int stars = int.parse(reviewsPage[index]["stars"].toString());
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Name : ${reviewsPage[index]['name']}",
                        style: GoogleFonts.quicksand(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Comment : ${reviewsPage[index]["feedback"]}",
                        style: GoogleFonts.aBeeZee(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 158, 241, 161),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  stars, // Number of stars
                                  (starIndex) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 25,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                // "${reviewsPage[index]["stars"]} ",
                                "Reviews",
                                style: GoogleFonts.quicksand(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(
                      "Query: ",
                      style: GoogleFonts.quicksand(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      reviewsPage[index]["query"],
                      style: GoogleFonts.aBeeZee(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
          ],
        );
      },
    );
  }
}

class _ReviewspageState extends State<Reviewspage> {
  @override
  Widget build(BuildContext context) {
    print(reviewsPage);
    // addReview();
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Reviews",
          style: GoogleFonts.quicksand(
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 65, 21, 141),
      ),
      body: returnBodyReview(),
    );
  }
}
