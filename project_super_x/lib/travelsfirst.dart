import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_screen/travelsecond.dart';
import 'package:intl/intl.dart';

List<Map<String, dynamic>> travellerList = [];

class TravellerBooking extends StatefulWidget {
  const TravellerBooking({super.key});

  @override
  State createState() => _TravellerBookingState();
}

class _TravellerBookingState extends State {
  TextEditingController dateController = TextEditingController();
  TextEditingController originController = TextEditingController();
  TextEditingController destinationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 65, 21, 141),
        title: Text(
          "Bus Search",
          style: GoogleFonts.quicksand(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "Same Buses, Cheapest Price, Guaranteed!",
                  style: GoogleFonts.quicksand(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(255, 21, 45, 141),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: originController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "Enter origin",
                  hintStyle: GoogleFonts.quicksand(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                  prefixIcon: const Icon(Icons.location_on),
                  suffixIcon: PopupMenuButton(
                    onSelected: (String value) {
                      setState(() {
                        originController.text = value;
                      });
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem<String>(
                        value: 'Pune',
                        child: Text(
                          'Pune',
                          style: GoogleFonts.aBeeZee(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Swargate',
                        child: Text(
                          'Swargate',
                          style: GoogleFonts.aBeeZee(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Katraj',
                        child: Text(
                          'Katraj',
                          style: GoogleFonts.aBeeZee(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                    child: const Icon(
                      Icons.arrow_drop_down_circle_sharp,
                      color: Color.fromARGB(255, 65, 21, 141),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: destinationController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "Enter Destination",
                  hintStyle: GoogleFonts.quicksand(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                  prefixIcon: const Icon(Icons.location_on),
                  suffixIcon: PopupMenuButton(
                    onSelected: (String value) {
                      setState(() {
                        destinationController.text = value;
                      });
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem<String>(
                        value: 'Bangalore',
                        child: Text(
                          'Bangalore',
                          style: GoogleFonts.aBeeZee(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Mumbai',
                        child: Text(
                          'Mumbai',
                          style: GoogleFonts.aBeeZee(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Ratnagiri',
                        child: Text(
                          'Ratnagiri',
                          style: GoogleFonts.aBeeZee(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                    child: const Icon(
                      Icons.arrow_drop_down_circle_sharp,
                      color: Color.fromARGB(255, 65, 21, 141),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: dateController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "Travel Date",
                  hintStyle: GoogleFonts.quicksand(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime(2024),
                        lastDate: DateTime(2025),
                      );
                      String formattedDate =
                          DateFormat.yMMMMEEEEd().format(pickedDate!);

                      setState(() {
                        dateController.text = formattedDate;
                      });
                    },
                    child: const Icon(Icons.calendar_month),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () async {
                  QuerySnapshot response = await FirebaseFirestore.instance
                      .collection('TravellerSearch')
                      .get();

                  travellerList.clear();

                  if (originController.text.trim().isNotEmpty &&
                      destinationController.text.trim().isNotEmpty &&
                      dateController.text.trim().isNotEmpty) {
                    for (int i = 0; i < response.docs.length; i++) {
                      if (response.docs[i]["origin"] ==
                              originController.text.toLowerCase() &&
                          response.docs[i]["destination"] ==
                              destinationController.text.toLowerCase()) {
                        travellerList.add({
                          "origin": response.docs[i]["origin"],
                          "destination": response.docs[i]["destination"],
                          "travelsNo": response.docs[i]["travelsNo"],
                          "travelsName": response.docs[i]["travelsName"],
                          "travelsCompName": response.docs[i]
                              ["travelsCompName"],
                          "travelStartTime": response.docs[i]
                              ["travelStartTime"],
                          "travelEndTime": response.docs[i]["travelEndTime"],
                          "trainTotalTime": response.docs[i]["trainTotalTime"],
                          "price": response.docs[i]["price"],
                          "availabelSeat": response.docs[i]["availabelSeat"],
                          "ratings": response.docs[i]["ratings"]
                        });
                      }
                    }

                    travelStart = originController.text;
                    travelEnd = destinationController.text;
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const TravelListPage(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("All Fields Compulsory"),
                      ),
                    );
                  }

                  setState(() {});
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 65, 21, 141),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Search",
                      style: GoogleFonts.quicksand(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                "assets/images/bus.jpg",
                height: 300,
                width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}