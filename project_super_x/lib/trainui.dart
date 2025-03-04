import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_screen/train_ui_search.dart';

class TrainUi extends StatefulWidget {
  const TrainUi({super.key});
  @override
  State createState() => _TrainUiState();
}

class _TrainUiState extends State {
  TextEditingController departController = TextEditingController();
  TextEditingController goingController = TextEditingController();
  TextEditingController prefferedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 65, 21, 141),
        title: Text(
          "Book a Train",
          style: GoogleFonts.quicksand(
              color: Colors.white,
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
        ),
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
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 10,
            bottom: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.train_sharp,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Depart From",
                    style: GoogleFonts.quicksand(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              TextField(
                style: GoogleFonts.quicksand(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 19, 18, 18),
                ),
                controller: departController,
                decoration: InputDecoration(
                  suffixIcon: PopupMenuButton(
                    onSelected: (String value) {
                      setState(() {
                        departController.text = value;
                      });
                    },
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          value: "Pune Junction",
                          child: Text(
                            "Pune Junction",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: "New Delhi",
                          child: Text(
                            "New Delhi",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: "Goa",
                          child: Text(
                            "Goa",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w700,
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
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.train_sharp,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Going to",
                    style: GoogleFonts.quicksand(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              TextField(
                style: GoogleFonts.quicksand(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 19, 18, 18),
                ),
                controller: goingController,
                decoration: InputDecoration(
                  suffixIcon: PopupMenuButton(
                    onSelected: (String value) {
                      setState(() {
                        goingController.text = value;
                      });
                    },
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          value: "Mumbai",
                          child: Text(
                            "Mumbai",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: "Chennai",
                          child: Text(
                            "Chennai",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: "Tirupati",
                          child: Text(
                            "Tirupati",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w700,
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
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.class_sharp,
                    color: Colors.grey,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Prefferd Class",
                    style: GoogleFonts.quicksand(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              TextField(
                style: GoogleFonts.quicksand(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 19, 18, 18),
                ),
                controller: prefferedController,
                decoration: InputDecoration(
                  suffixIcon: PopupMenuButton(
                    onSelected: (String value) {
                      setState(() {
                        prefferedController.text = value;
                      });
                    },
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          value: "Economy",
                          child: Text(
                            "Economy",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: "Business",
                          child: Text(
                            "Business",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: "Sleeper",
                          child: Text(
                            "Sleeper",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: "Second Seater",
                          child: Text(
                            "Second Seater",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w700,
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
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: GestureDetector(
                    onTap: () async {
                      QuerySnapshot response = await FirebaseFirestore.instance
                          .collection('AvailableTrains')
                          .get();

                      trainList.clear();
                      if (departController.text.trim().isNotEmpty &&
                          goingController.text.trim().isNotEmpty &&
                          prefferedController.text.trim().isNotEmpty) {
                        for (int i = 0; i < response.docs.length; i++) {
                          if (response.docs[i]["departFrom"] ==
                                  departController.text.toLowerCase() &&
                              response.docs[i]["goingTo"] ==
                                  goingController.text.toLowerCase()) {
                            trainList.add({
                              'departFrom': response.docs[i]["departFrom"],
                              'goingTo': response.docs[i]["goingTo"],
                              'trainNo': response.docs[i]["trainNo"],
                              'trainName': response.docs[i]["trainName"],
                              'trainStartTime': response.docs[i]
                                  ["trainStartTime"],
                              'trainEndTime': response.docs[i]["trainEndTime"],
                              'date': response.docs[i]["date"],
                              'price': response.docs[i]["price"],
                              'trainTotalTime': response.docs[i]
                                  ["trainTotalTime"],
                            });
                          }
                        }

                        start = departController.text.trim();
                        end = goingController.text.trim();

                        departController.clear();
                        goingController.clear();
                        prefferedController.clear();

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const TrainListPage(),
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
                      padding: const EdgeInsets.only(
                        top: 8,
                        bottom: 8,
                        left: 50,
                        right: 50,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 65, 21, 141),
                      ),
                      child: Text(
                        "FIND TRAINS",
                        style: GoogleFonts.quicksand(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset("assets/images/train.jpg"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
