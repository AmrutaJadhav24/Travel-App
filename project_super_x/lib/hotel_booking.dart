import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_screen/home_screen.dart';
import 'package:home_screen/hotel_list.dart';
import 'package:home_screen/hotel_page.dart';
import 'package:home_screen/payment_confirmed.dart';
import 'package:intl/intl.dart';

/// hotel first page

class HotelBooking extends StatefulWidget {
  const HotelBooking({super.key});

  @override
  State createState() => _HotelBookingState();
}

class _HotelBookingState extends State {
  int adultCount = 0;
  int roomCount = 0;

  TextEditingController cityNameController = TextEditingController();
  TextEditingController checkInController = TextEditingController();
  TextEditingController checkOutController = TextEditingController();

  showbottomsheet() {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setBottomSheetState) {
            return Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                top: 30,
                bottom: MediaQuery.of(context).viewInsets.bottom,
                right: 10,
                left: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Room & Guest",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 0.4,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.blue,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/adult.jpg",
                        height: 30,
                        width: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Adult",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(5),
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.blue,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setBottomSheetState(() {
                                  if (adultCount > 0) adultCount--;
                                });
                              },
                              child: const Icon(Icons.remove),
                            ),
                            Text("$adultCount"),
                            GestureDetector(
                              onTap: () {
                                setBottomSheetState(() {
                                  adultCount++;
                                });
                              },
                              child: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.house,
                        size: 27,
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      const Text(
                        "Room",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(5),
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.blue,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setBottomSheetState(() {
                                  if (roomCount > 0) roomCount--;
                                });
                              },
                              child: const Icon(Icons.remove),
                            ),
                            Text("$roomCount"),
                            GestureDetector(
                              onTap: () {
                                setBottomSheetState(() {
                                  roomCount++;
                                });
                              },
                              child: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 237, 216, 184)),
                    child: const Text(
                      "Please provide right no of children along with there right age for best options and price",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Colors.brown,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      if (adultCount == 0 || roomCount == 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text("Please fill data for Guests and Room"),
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 2),
                          ),
                        );
                        return;
                      }
                      setState(() {});
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 65, 21, 141),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          "Done",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Hotel Search",
          style: GoogleFonts.quicksand(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 65, 21, 141),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            top: 20,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 10,
          ),
          child: Column(
            children: [
              /// Text same hotel cheapest price guaranteed
              Text(
                "SAME HOTEL, CHEAPEST PRICE, GUARANTEED!",
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                  ),
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              /// enter city name , location, hotel
              TextField(
                controller: cityNameController,
                decoration: InputDecoration(
                  suffixIcon: PopupMenuButton(
                    onSelected: (String value) {
                      setState(() {
                        cityNameController.text = value;
                      });
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem<String>(
                        value: 'Delhi',
                        child: Text(
                          'Delhi',
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
                        value: 'Pune',
                        child: Text(
                          'Pune',
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
                  border: const OutlineInputBorder(),
                  hintText: "Enter City name",
                  hintStyle: GoogleFonts.aBeeZee(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.location_on_outlined,
                    size: 30,
                  ),
                ),
                style: GoogleFonts.aBeeZee(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              /// row check-in and check-out
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 170,
                      child: TextField(
                        controller: checkInController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: "Check-in",
                          hintStyle: GoogleFonts.aBeeZee(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          prefixIcon: const Icon(Icons.calendar_month),
                        ),
                        style: GoogleFonts.aBeeZee(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              firstDate: DateTime(2024),
                              lastDate: DateTime(2025));
                          String formattedDate =
                              DateFormat('MMMM dd, yyyy').format(pickedDate!);
                          setState(() {
                            checkInController.text = formattedDate;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 170,
                      child: TextField(
                        controller: checkOutController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: "Check-out",
                          hintStyle: GoogleFonts.aBeeZee(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          prefixIcon: const Icon(Icons.calendar_month),
                        ),
                        style: GoogleFonts.aBeeZee(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            firstDate: DateTime(2024),
                            lastDate: DateTime(2025),
                          );
                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('MMMM dd, yyyy').format(pickedDate);
                            setState(() {
                              checkOutController.text = formattedDate;
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              GestureDetector(
                onTap: () {
                  showbottomsheet();
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.person,
                        size: 40,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Guest and Room",
                            style: GoogleFonts.aBeeZee(
                              textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "$adultCount Guests",
                                style: GoogleFonts.aBeeZee(
                                  textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                "$roomCount Room",
                                style: GoogleFonts.aBeeZee(
                                  textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.add_circle_outline,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              GestureDetector(
                onTap: () async {
                  if (cityNameController.text.trim().isEmpty ||
                      checkInController.text.trim().isEmpty ||
                      checkOutController.text.trim().isEmpty ||
                      (adultCount == 0 && roomCount == 0)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please fill all the information"),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }
                  QuerySnapshot respons = await FirebaseFirestore.instance
                      .collection('HotelsList')
                      .get();
                  hotels.clear();
                  for (int i = 0; i < respons.docs.length; i++) {
                    if (respons.docs[i]["city"] ==
                        cityNameController.text.trim()) {
                      hotels.add({
                        'city': respons.docs[i]['city'],
                        'image': respons.docs[i]['image'],
                        'name': respons.docs[i]['name'],
                        'location': respons.docs[i]['location'],
                        'price': respons.docs[i]['price'],
                        'duration': respons.docs[i]['duration']
                      });
                    }
                  }

                  checkIn = checkInController.text;
                  checkOut = checkOutController.text;
                  type = 'Hotels';
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HotelListPage(),
                    ),
                  );
                  setState(() {});
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 65, 21, 141),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Search",
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              /// image
              Image.asset("assets/images/hotel.jpg"),
            ],
          ),
        ),
      ),
    );
  }
}
