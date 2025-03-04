import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_screen/About_us.dart';
import 'package:home_screen/TrainUi.dart';
import 'package:home_screen/hotel_booking.dart';
import 'package:home_screen/loginpage.dart';
import 'package:home_screen/main.dart';
import 'package:home_screen/mybookingpage.dart';
import 'package:home_screen/oneway.dart';
import 'package:home_screen/package_page.dart';
import 'package:home_screen/payment_confirmed.dart';
import 'package:home_screen/profile.dart';
import 'package:home_screen/rateus.dart';
import 'package:home_screen/reviews.dart';
import 'package:home_screen/transaction.dart';
import 'package:home_screen/travelsfirst.dart';
import 'package:home_screen/wishlistpage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State createState() => _HomeScreenState();
}

List<List<Map<String, dynamic>>> iconColorList = [
  [
    {"icon": Icons.favorite_outline, "colour": Colors.black, "value": true},
    {"icon": Icons.favorite_outline, "colour": Colors.black, "value": true},
    {"icon": Icons.favorite_outline, "colour": Colors.black, "value": true},
    {"icon": Icons.favorite_outline, "colour": Colors.black, "value": true},
    {"icon": Icons.favorite_outline, "colour": Colors.black, "value": true},
  ],
  [
    {"icon": Icons.favorite_outline, "colour": Colors.black, "value": true},
    {"icon": Icons.favorite_outline, "colour": Colors.black, "value": true},
    {"icon": Icons.favorite_outline, "colour": Colors.black, "value": true},
    {"icon": Icons.favorite_outline, "colour": Colors.black, "value": true},
    {"icon": Icons.favorite_outline, "colour": Colors.black, "value": true},
  ]
];

List<String> packageName = ["Holiday Packages", "Tours Packages"];

// int bodyIndex = 0;
// checking clicked or not in navigation bar
bool home = true;
bool booking = true;
bool wishlist = true;
bool profile = true;
bool transaction = true;

class _HomeScreenState extends State {
  @override
  Widget build(BuildContext context) {
    // Return packages Option to ListViewBuilder 2
    Widget returnOption(int index) {
      if (packagesList.length - 1 == index) {
        return Column(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.bookmark_add,
                  color: Color.fromARGB(255, 21, 45, 141),
                  size: 30,
                ),
                Text(
                  "Why Book With Us ?",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 15,
                bottom: 7.5,
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 253, 238, 199),
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      right: 8,
                    ),
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.headphones_outlined,
                      color: Colors.amber,
                      size: 35,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "24/7 Customer Support",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "We are here to help whenever you need us",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 7.5,
                bottom: 7.5,
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 211, 252, 253),
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      right: 8,
                    ),
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.shield_outlined,
                      color: Colors.blue,
                      size: 35,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Secure Booking Process",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "Your personal information is secure using the latest industry standard",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 7.5,
                bottom: 7.5,
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 208, 255, 204),
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      right: 8,
                    ),
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.people_outline,
                      color: Colors.green,
                      size: 35,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Trusted By Members",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "We've earned 4.6/5 star on the Play Store",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 7.5,
                bottom: 15,
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 253, 211, 225),
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      right: 8,
                    ),
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.emoji_emotions_outlined,
                      color: Colors.pink,
                      size: 35,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "25 million Happy Members",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "Millions of members worldwide rely on Trip Navigator for their travel needs",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      } else {
        return Container();
      }
    }

    // Return the Single Widgets 1 time to ListViewBuilder 2
    Widget returnSingle(int index) {
      if (index == 0) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome,",
              style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 21, 7, 174),
                ),
              ),
            ),
            Text(
              userInformation[0]['name'],
              style: GoogleFonts.aBeeZee(
                textStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 65, 21, 141),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Flights
                  GestureDetector(
                    onTap: () {
                      // bodyIndex = 5;
                      tripType = "One-Way";
                      type = 'Flight';
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const OneWayUi(),
                        ),
                      );
                    },
                    child: Container(
                      height: 110,
                      width: 130,
                      margin: const EdgeInsets.only(
                        right: 15,
                      ),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 1,
                        ),
                        image: const DecorationImage(
                            image: AssetImage(
                              "assets/images/bgcontainer.jpg",
                            ),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: const Alignment(0, 0),
                      child: Column(
                        children: [
                          Text(
                            "Flights",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Icon(
                            Icons.airplanemode_active_outlined,
                            size: 50,
                            color: Color.fromARGB(255, 65, 21, 141),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Hotels
                  GestureDetector(
                    onTap: () {
                      type = 'Hotel';
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HotelBooking(),
                        ),
                      );
                    },
                    child: Container(
                      height: 110,
                      width: 130,
                      margin: const EdgeInsets.only(
                        right: 15,
                      ),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 1,
                        ),
                        image: const DecorationImage(
                            image: AssetImage(
                              "assets/images/bgcontainer.jpg",
                            ),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: const Alignment(0, 0),
                      child: Column(
                        children: [
                          Text(
                            "Hotels",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Icon(
                            Icons.villa_rounded,
                            size: 50,
                            color: Color.fromARGB(255, 65, 21, 141),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Trains
                  GestureDetector(
                    onTap: () {
                      // bodyIndex = 14;
                      type = 'Train';
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const TrainUi(),
                        ),
                      );
                    },
                    child: Container(
                      width: 130,
                      height: 110,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(
                        right: 15,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: const DecorationImage(
                            image: AssetImage(
                              "assets/images/bgcontainer.jpg",
                            ),
                            fit: BoxFit.cover),
                        border: Border.all(
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: const Alignment(0, 0),
                      child: Column(
                        children: [
                          Text(
                            "Trains",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Icon(
                            Icons.train_outlined,
                            size: 50,
                            color: Color.fromARGB(255, 65, 21, 141),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Traveller
                  GestureDetector(
                    onTap: () {
                      type = 'Travel';
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const TravellerBooking(),
                        ),
                      );
                    },
                    child: Container(
                      width: 130,
                      height: 110,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: const DecorationImage(
                            image: AssetImage(
                              "assets/images/bgcontainer.jpg",
                            ),
                            fit: BoxFit.cover),
                        border: Border.all(
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: const Alignment(0, 0),
                      child: Column(
                        children: [
                          Text(
                            "Traveller",
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Icon(
                            Icons.travel_explore_outlined,
                            size: 50,
                            color: Color.fromARGB(255, 65, 21, 141),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 15,
                bottom: 15,
              ),
              child: Image.asset(
                "assets/images/advertise.jpg",
              ),
            ),
          ],
        );
      } else {
        return Container();
      }
    }

    // Drawer Index
    Widget titleDrawer() {
      return Container(
        padding: const EdgeInsets.only(
          top: 40,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          color: Colors.white,
        ),
        width: (MediaQuery.of(context).size.width / 2) + 130,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
            Center(
              child: Container(
                width: 90,
                height: 90,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 65, 21, 141),
                ),
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 60,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                userInformation[0]['name'],
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  color: const Color.fromARGB(255, 65, 21, 141),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.home_outlined,
                      size: 30,
                      color: Color.fromARGB(255, 65, 21, 141),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Home",
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        color: const Color.fromARGB(255, 65, 21, 141),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                home = false;
                profile = false;
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.picture_in_picture,
                      size: 30,
                      color: Color.fromARGB(255, 65, 21, 141),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Profile",
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        color: const Color.fromARGB(255, 65, 21, 141),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AboutUs()),
                );
              },
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.info_outline,
                      size: 30,
                      color: Color.fromARGB(255, 65, 21, 141),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "About Us",
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        color: const Color.fromARGB(255, 65, 21, 141),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // bodyIndex = 13;

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const RateUsApp(),
                  ),
                );
              },
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.rate_review_outlined,
                      size: 30,
                      color: Color.fromARGB(255, 65, 21, 141),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Rate Us",
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        color: const Color.fromARGB(255, 65, 21, 141),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                home = false;
                profile = false;
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Reviewspage()),
                );
              },
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.reviews,
                      size: 30,
                      color: Color.fromARGB(255, 65, 21, 141),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Reviews",
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        color: const Color.fromARGB(255, 65, 21, 141),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                  ModalRoute.withName(''),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(10),
                    )),
                child: Row(
                  children: [
                    const Icon(
                      Icons.logout,
                      size: 30,
                      color: Color.fromARGB(255, 65, 21, 141),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Logout",
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        color: const Color.fromARGB(255, 65, 21, 141),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    // function created by clicking icons changes
    void onTapItems(int index) async {
      if (index == 0) {
        home = true;
        booking = true;
        wishlist = true;
        profile = true;
        transaction = true;
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
          ModalRoute.withName(''),
        );
      } else if (index == 1) {
        booking = false;
        home = false;
        wishlist = true;
        profile = true;
        transaction = true;
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const MyBookingsPage(),
          ),
        );
      } else if (index == 2) {
        transaction = false;
        wishlist = true;
        booking = true;
        home = false;
        profile = true;
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const TransactionHistory(),
          ),
        );
      } else if (index == 3) {
        wishlist = false;
        booking = true;
        home = false;
        profile = true;
        transaction = true;
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const WishlistPage(),
          ),
        );
      } else {
        booking = true;
        wishlist = true;
        transaction = true;
        profile = false;
        home = false;
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ProfilePage(),
          ),
        );
      }
    }

    void callForAddData() async {
      QuerySnapshot response =
          await FirebaseFirestore.instance.collection('PackageBooking').get();

      bookings.clear();
      for (int i = 0; i < response.docs.length; i++) {
        if (userInformation[0]['username'] == response.docs[i]['username']) {
          bookings.add({
            'username': response.docs[i]['username'],
            'dest': response.docs[i]['dest'],
            'port': response.docs[i]['port'],
            'date': response.docs[i]['date'],
            'name': response.docs[i]['name'],
            'image': response.docs[i]['image'],
            'type': response.docs[i]['type'],
          });
        }
      }
      // print(bookings);
    }

    callForAddData();
    // Started Application
    return Scaffold(
      // Drawer
      drawer: titleDrawer(),

      // AppBar
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 65, 21, 141),
        title: Text(
          "Trip Navigator",
          style: GoogleFonts.quicksand(
            textStyle: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        // leading: GestureDetector(
        //   onTap: (){
        //     // titleDrawer();
        //   },
        //   child: const Icon(
        //     Icons.menu,
        //     color: Colors.white,
        //   ),
        // ),
        centerTitle: true,
      ),

      // Body
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: packagesList.length,
          itemBuilder: (context, outerIndex) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                returnSingle(outerIndex),
                Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 8),
                  child: Text(
                    packageName[outerIndex],
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 240,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: packagesList[outerIndex].length,
                    itemBuilder: (context, innerIndex) {
                      return Row(
                        children: [
                          Stack(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  packageBooking.clear();
                                  QuerySnapshot response =
                                      await FirebaseFirestore.instance
                                          .collection('SpecificHotel')
                                          .get();
                                  for (int i = 0;
                                      i < response.docs.length;
                                      i++) {
                                    if (response.docs[i]['name'] ==
                                        packagesList[outerIndex][innerIndex]
                                            ['name']) {
                                      packageBooking.add({
                                        'name': response.docs[i]['name'],
                                        'image1': response.docs[i]['image1'],
                                        'image2': response.docs[i]['image2'],
                                        'image3': response.docs[i]['image3'],
                                        'holidayName': response.docs[i]
                                            ['holidayName'],
                                        'nightCity': response.docs[i]
                                            ['nightCity'],
                                        'startLoc': response.docs[i]
                                            ['startLoc'],
                                        'endLoc': response.docs[i]['endLoc'],
                                        'startTime': response.docs[i]
                                            ['startTime'],
                                        'endTime': response.docs[i]['endTime'],
                                        'startDate': response.docs[i]
                                            ['startDate'],
                                        'endDate': response.docs[i]['endDate'],
                                        'price': response.docs[i]['price'],
                                        'similarName': response.docs[i]
                                            ['similarName'],
                                        'overview': response.docs[i]
                                            ['overview'],
                                        'details': response.docs[i]['details'],
                                        'similar': response.docs[i]['similar'],
                                        'downImg1': response.docs[i]
                                            ['downImg1'],
                                        'downImg2': response.docs[i]
                                            ['downImg2'],
                                      });
                                      String normalVar =
                                          response.docs[i]['split'];
                                      splitC2W.clear();
                                      splitC2W =
                                          normalVar.split('C2WShashiSir');
                                      break;
                                    }
                                  }
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const Packagebookingpage(),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 270,
                                  margin: const EdgeInsets.only(
                                    bottom: 20,
                                    right: 20,
                                    left: 10,
                                  ),
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.25),
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        offset: const Offset(3, 5),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        clipBehavior: Clip.antiAlias,
                                        margin: const EdgeInsets.only(
                                          bottom: 15,
                                        ),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        height: 112,
                                        width: 260,
                                        child: Image.asset(
                                          packagesList[outerIndex][innerIndex]
                                              ["images"],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(
                                                top: 5,
                                                bottom: 5,
                                                right: 10,
                                                left: 10,
                                              ),
                                              decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                    222,
                                                    231,
                                                    187,
                                                    56,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Text(
                                                packagesList[outerIndex]
                                                    [innerIndex]["name"],
                                                style: GoogleFonts.aBeeZee(
                                                  textStyle: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const Spacer(),
                                            Text(
                                              packagesList[outerIndex]
                                                  [innerIndex]["price"],
                                              style: GoogleFonts.aBeeZee(
                                                textStyle: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            packagesList[outerIndex][innerIndex]
                                                ["night"],
                                            style: GoogleFonts.aBeeZee(
                                              textStyle: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            "per person",
                                            style: GoogleFonts.aBeeZee(
                                              textStyle: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 6,
                                right: 30,
                                child: GestureDetector(
                                  onTap: () async {
                                    if (iconColorList[outerIndex][innerIndex]
                                        ['value']) {
                                      iconColorList[outerIndex][innerIndex]
                                          ['value'] = false;
                                      iconColorList[outerIndex][innerIndex]
                                          ['icon'] = Icons.favorite;
                                      iconColorList[outerIndex][innerIndex]
                                          ['colour'] = Colors.pink;

                                      await FirebaseFirestore.instance
                                          .collection('WishList')
                                          .add({
                                        'username': userInformation[0]
                                            ['username'],
                                        'images': packagesList[outerIndex]
                                            [innerIndex]['images'],
                                        'name': packagesList[outerIndex]
                                            [innerIndex]['name'],
                                        'night': packagesList[outerIndex]
                                            [innerIndex]['night'],
                                        'price': packagesList[outerIndex]
                                            [innerIndex]['price'],
                                      });

                                      listWishlist.clear();
                                      QuerySnapshot response =
                                          await FirebaseFirestore.instance
                                              .collection('WishList')
                                              .get();
                                      for (int i = 0;
                                          i < response.docs.length;
                                          i++) {
                                        if (userInformation[0]['username'] ==
                                            response.docs[i]['username']) {
                                          listWishlist.add({
                                            'username': response.docs[i]
                                                ['username'],
                                            'images': response.docs[i]
                                                ['images'],
                                            'name': response.docs[i]['name'],
                                            'night': response.docs[i]['night'],
                                            'price': response.docs[i]['price'],
                                          });
                                        }
                                      }
                                      print(listWishlist);
                                    } else {
                                      iconColorList[outerIndex][innerIndex]
                                          ['value'] = true;
                                      iconColorList[outerIndex][innerIndex]
                                          ['icon'] = Icons.favorite_outline;
                                      iconColorList[outerIndex][innerIndex]
                                          ['colour'] = Colors.black;

                                      QuerySnapshot response =
                                          await FirebaseFirestore.instance
                                              .collection('WishList')
                                              .get();

                                      for (int i = 0;
                                          i < response.docs.length;
                                          i++) {
                                        if (response.docs[i]['name'] ==
                                            packagesList[outerIndex][innerIndex]
                                                ['name']) {
                                          await FirebaseFirestore.instance
                                              .collection("WishList")
                                              .doc(response.docs[i].id)
                                              .delete();
                                          // listWishlist.removeAt(innerIndex);
                                          break;
                                        }
                                      }

                                      listWishlist.clear();
                                      QuerySnapshot response1 =
                                          await FirebaseFirestore.instance
                                              .collection("WishList")
                                              .get();
                                      for (int i = 0;
                                          i < response1.docs.length;
                                          i++) {
                                        listWishlist.add({
                                          'username': response1.docs[i]
                                              ['username'],
                                          'images': response1.docs[i]['images'],
                                          'name': response1.docs[i]['name'],
                                          'night': response1.docs[i]['night'],
                                          'price': response1.docs[i]['price'],
                                        });
                                      }
                                      print(listWishlist);
                                    }
                                    // listWishlist = await showDataAll();
                                    // print(listWishlist);
                                    // print("hii");
                                    // print(await showDataAll());
                                    // print("hii");
                                    // print(await showData(usernameLoc));

                                    setState(() {});
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      fill: 0.5,
                                      iconColorList[outerIndex][innerIndex]
                                          ['icon'],
                                      size: 25,
                                      color: iconColorList[outerIndex]
                                          [innerIndex]['colour'],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
                returnOption(outerIndex),
              ],
            );
          },
        ),
      ),

      // Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: GoogleFonts.quicksand(
          textStyle: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        unselectedLabelStyle: GoogleFonts.quicksand(
          textStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        onTap: onTapItems,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              home ? Icons.home : Icons.home_outlined,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              booking ? Icons.book_outlined : Icons.book,
            ),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              transaction
                  ? Icons.account_balance_wallet_outlined
                  : Icons.account_balance_wallet,
            ),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              wishlist ? Icons.favorite_outline : Icons.favorite,
            ),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              profile ? Icons.person_outlined : Icons.person,
              size: 25,
            ),
            label: 'Profile',
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 65, 21, 141),
      ),
    );
  }
}
