import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:home_screen/flightsearch1.dart';

import 'package:home_screen/oneway.dart';
import 'package:home_screen/payment_confirmed.dart';
import 'package:intl/intl.dart';

class RoundTripUi extends StatefulWidget {
  const RoundTripUi({super.key});

  @override
  State createState() => _RoundTripUiState();
}

String? date1;
String? date2;

class _RoundTripUiState extends State {
  TextEditingController departController = TextEditingController();
  TextEditingController goingtoController = TextEditingController();
  TextEditingController travelController = TextEditingController();
  TextEditingController departDateController = TextEditingController();
  TextEditingController returnDateController = TextEditingController();

  List flightList2 = [];
  String? selectedDepart;
  String? selectedGoingTo;
  String? selectedClass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                tripType = "One-Way";
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            );
          },
        ),
        backgroundColor: const Color.fromARGB(255, 65, 21, 141),
        title: Text(
          "Book a Flight",
          style: GoogleFonts.quicksand(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.only(
                top: 15,
                bottom: 15,
                left: 2,
                right: 2,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                border: Border.all(
                  color: Colors.grey,
                ),
                color: Colors.white60,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      tripType = "One-Way";
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OneWayUi(),
                        ),
                      );
                    },
                    child: Text(
                      "One-Way",
                      style: GoogleFonts.aBeeZee(
                        fontWeight: FontWeight.w900,
                        color: tripType == "One-Way"
                            ? const Color.fromARGB(255, 65, 21, 141)
                            : Colors.grey,
                      ),
                    ),
                  ),
                  Text(
                    "Round-Trip",
                    style: GoogleFonts.aBeeZee(
                      fontWeight: FontWeight.w900,
                      color: tripType == "Round-Trip"
                          ? const Color.fromARGB(255, 65, 21, 141)
                          : Colors.grey,
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     tripType = "Multi-city";
                  //     Navigator.pushReplacement(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => const MultiCityUi(),
                  //       ),
                  //     );
                  //   },
                  //   child: Text(
                  //     "Multi-City",
                  //     style: GoogleFonts.aBeeZee(
                  //       fontWeight: FontWeight.w900,
                  //       color: tripType == "Multi-city"
                  //           ? const Color.fromARGB(255, 65, 21, 141)
                  //           : Colors.grey,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  color: Colors.white60,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                        left: 8,
                      ),
                      child: Text(
                        "DEPART FROM",
                        style: GoogleFonts.quicksand(
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                      ),
                      child: TextField(
                        controller: departController,
                        decoration: InputDecoration(
                          suffixIcon: PopupMenuButton<String>(
                            onSelected: (String value) {
                              setState(() {
                                selectedDepart = value;
                                departController.text = selectedDepart!;
                              });
                            },
                            itemBuilder: (BuildContext context) {
                              return [
                                PopupMenuItem<String>(
                                  value: 'Kolkata',
                                  child: Text(
                                    'Kolkata',
                                    style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                PopupMenuItem<String>(
                                  value: 'New Delhi',
                                  child: Text(
                                    'New Delhi',
                                    style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                PopupMenuItem<String>(
                                  value: 'Mumbai',
                                  child: Text(
                                    'Mumbai',
                                    style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                PopupMenuItem<String>(
                                  value: 'Jammu Kashmir',
                                  child: Text(
                                    'Jammu Kashmir',
                                    style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                PopupMenuItem<String>(
                                  value: 'Bengaluru',
                                  child: Text(
                                    'Bengaluru',
                                    style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ];
                            },
                            child: const Icon(
                              Icons.arrow_drop_down_circle_sharp,
                              color: Color.fromARGB(255, 65, 21, 141),
                            ),
                          ),
                          border: InputBorder.none,
                        ),
                        style: GoogleFonts.aBeeZee(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                )),
            Container(
                margin: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  color: Colors.white60,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                        left: 8,
                      ),
                      child: Text(
                        "GOING TO",
                        style: GoogleFonts.quicksand(
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                      ),
                      child: TextField(
                        controller: goingtoController,
                        decoration: InputDecoration(
                          suffixIcon: PopupMenuButton<String>(
                            onSelected: (String value) {
                              setState(() {
                                selectedGoingTo = value;
                                goingtoController.text = selectedGoingTo!;
                              });
                            },
                            itemBuilder: (BuildContext context) {
                              return [
                                PopupMenuItem<String>(
                                  value: 'Kolkata',
                                  child: Text(
                                    'Kolkata',
                                    style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                PopupMenuItem<String>(
                                  value: 'New Delhi',
                                  child: Text(
                                    'New Delhi',
                                    style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                PopupMenuItem<String>(
                                  value: 'Mumbai',
                                  child: Text(
                                    'Mumbai',
                                    style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                PopupMenuItem<String>(
                                  value: 'Jammu Kashmir',
                                  child: Text(
                                    'Jammu Kashmir',
                                    style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                PopupMenuItem<String>(
                                  value: 'Bengaluru',
                                  child: Text(
                                    'Bengaluru',
                                    style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ];
                            },
                            child: const Icon(
                              Icons.arrow_drop_down_circle_sharp,
                              color: Color.fromARGB(255, 65, 21, 141),
                            ),
                          ),
                          border: InputBorder.none,
                        ),
                        style: GoogleFonts.aBeeZee(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                )),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: const EdgeInsets.all(10),
                      width: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        color: Colors.white60,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              left: 8,
                            ),
                            child: Text(
                              "DEPARTURE DATE",
                              style: GoogleFonts.quicksand(
                                color: Colors.grey,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          TextField(
                              controller: departDateController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.calendar_month_outlined,
                                  color: Color.fromARGB(255, 65, 21, 141),
                                ),
                                border: InputBorder.none,
                              ),
                              style: GoogleFonts.aBeeZee(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    firstDate: DateTime(2024),
                                    lastDate: DateTime(2025));
                                String formattedDate =
                                    DateFormat.yMMMMEEEEd().format(pickedDate!);
                                setState(() {
                                  departDateController.text = formattedDate;
                                });
                              }),
                        ],
                      )),
                  Container(
                      margin: const EdgeInsets.all(10),
                      width: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        color: Colors.white60,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              left: 8,
                            ),
                            child: Text(
                              "RETURN DATE",
                              style: GoogleFonts.quicksand(
                                color: Colors.grey,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          TextField(
                            controller: returnDateController,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.calendar_month_outlined,
                                color: Color.fromARGB(255, 65, 21, 141),
                              ),
                              border: InputBorder.none,
                            ),
                            style: GoogleFonts.aBeeZee(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime(2024),
                                  lastDate: DateTime(2025));
                              String formattedDate =
                                  DateFormat.yMMMMEEEEd().format(pickedDate!);
                              setState(() {
                                returnDateController.text = formattedDate;
                              });
                            },
                          ),
                        ],
                      )),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  color: Colors.white60,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                        left: 8,
                      ),
                      child: Text(
                        "TRAVELLER, CLASS",
                        style: GoogleFonts.quicksand(
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    TextField(
                      controller: travelController,
                      decoration: InputDecoration(
                        suffixIcon: PopupMenuButton<String>(
                          onSelected: (String value) {
                            setState(() {
                              selectedClass = value;
                              travelController.text = selectedClass!;
                            });
                          },
                          itemBuilder: (BuildContext context) {
                            return [
                              PopupMenuItem<String>(
                                value: 'Economy',
                                child: Text(
                                  'Economy',
                                  style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              PopupMenuItem<String>(
                                value: 'Premium Economy',
                                child: Text(
                                  'Premium Economy',
                                  style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              PopupMenuItem<String>(
                                value: 'Business',
                                child: Text(
                                  'Business',
                                  style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              PopupMenuItem<String>(
                                value: 'First Class',
                                child: Text(
                                  'First Class',
                                  style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ];
                          },
                          child: const Icon(
                            Icons.arrow_drop_down_circle_sharp,
                            color: Color.fromARGB(255, 65, 21, 141),
                          ),
                        ),
                        prefixIcon: const Icon(
                          Icons.person_2_rounded,
                          color: Color.fromARGB(255, 65, 21, 141),
                        ),
                        border: InputBorder.none,
                      ),
                      style: GoogleFonts.aBeeZee(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 100,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 20,
                  left: 10,
                  right: 10,
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    bool check = true;
                    if (departController.text.isEmpty ||
                        goingtoController.text.isEmpty ||
                        departDateController.text.isEmpty ||
                        returnDateController.text.isEmpty ||
                        travelController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please fill all fields")),
                      );
                      check = false;
                    } else if (selectedDepart == selectedGoingTo) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Origin and Destination Can't be Same!",
                            style: GoogleFonts.quicksand(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                      check = false;
                    } else {
                      log("${departController.text.trim()}");
                      for (int i = 0; i < departController.text.length; i++) {
                        if (departController.text.codeUnitAt(i) != 32 &&
                            (departController.text.codeUnitAt(i) < 65 ||
                                departController.text.codeUnitAt(i) > 90) &&
                            (departController.text.codeUnitAt(i) < 97 ||
                                departController.text.codeUnitAt(i) > 122)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Enter valid City or Country",
                                style: GoogleFonts.quicksand(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                          check = false;
                          break;
                        }
                      }
                      log("${goingtoController.text.length}");
                      for (int i = 0; i < goingtoController.text.length; i++) {
                        log("$i");
                        if (goingtoController.text.codeUnitAt(i) != 32 &&
                            (goingtoController.text.codeUnitAt(i) < 65 ||
                                goingtoController.text.codeUnitAt(i) > 90) &&
                            (goingtoController.text.codeUnitAt(i) < 97 ||
                                goingtoController.text.codeUnitAt(i) > 122)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Enter valid City or Country",
                                style: GoogleFonts.quicksand(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                          check = false;
                          break;
                        }
                      }
                      log("Suresh");
                      for (int i = 0; i < travelController.text.length; i++) {
                        log("pratik");
                        if (travelController.text.codeUnitAt(i) != 32 &&
                            (travelController.text.codeUnitAt(i) < 65 ||
                                travelController.text.codeUnitAt(i) > 90) &&
                            (travelController.text.codeUnitAt(i) < 97 ||
                                travelController.text.codeUnitAt(i) > 122)) {
                          log("${travelController.text.codeUnitAt(i)}");
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Enter valid Class",
                                style: GoogleFonts.quicksand(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                          check = false;
                          break;
                        }
                      }
                    }
                    log("$check");
                    if (check) {
                      log("amruta");
                      QuerySnapshot response = await FirebaseFirestore.instance
                          .collection('AvailableFlightsRT')
                          .get();
                      flightList2.clear();
                      for (int i = 0; i < response.docs.length; i++) {
                        if (response.docs[i]['departFrom'] ==
                                departController.text.trim() &&
                            response.docs[i]['goingTo'] ==
                                goingtoController.text.trim()) {
                          flightList2.add({
                            'image': response.docs[i]['image'],
                            'departFrom': response.docs[i]['departFrom'],
                            'departTime': response.docs[i]['departTime'],
                            'flightName': response.docs[i]['flightName'],
                            'goingTo': response.docs[i]['goingTo'],
                            'price': response.docs[i]['price'],
                            'returnTime': response.docs[i]['returnTime'],
                            'stop': response.docs[i]['stop'],
                            'time': response.docs[i]['time'],
                            'image1': response.docs[i]['image1'],
                            'departFrom1': response.docs[i]['departFrom1'],
                            'departTime1': response.docs[i]['departTime1'],
                            'flightName1': response.docs[i]['flightName1'],
                            'goingTo1': response.docs[i]['goingTo1'],
                            'price1': response.docs[i]['price1'],
                            'returnTime1': response.docs[i]['returnTime1'],
                            'stop1': response.docs[i]['stop1'],
                            'time1': response.docs[i]['time1'],
                          });
                        }
                      }
                      // type = "Flight";
                      type4 = "${departDateController.text} to ${returnDateController.text}";
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              FlightSearch1(flightListRT: flightList2),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 65, 21, 141),
                    minimumSize: const Size(300, 60),
                  ),
                  child: Text(
                    "Search Flights",
                    style: GoogleFonts.quicksand(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
