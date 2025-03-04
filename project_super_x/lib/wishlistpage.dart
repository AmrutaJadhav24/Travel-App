import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_screen/home_screen.dart';
import 'package:home_screen/main.dart';
import 'package:home_screen/mybookingpage.dart';
import 'package:home_screen/package_page.dart';
import 'package:home_screen/profile.dart';
import 'package:home_screen/transaction.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State createState() => _WishlistPageState();
}

List<Map<String, dynamic>> listWishlist = [];

Widget? firstName(int index) {
  if (index == 0) {
    return Row(
      children: [
        Text(
          "Packages ",
          style: GoogleFonts.quicksand(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  } else {
    return Container();
  }
}

class _WishlistPageState extends State {
  Widget returnToggle() {
    if (listWishlist.isEmpty) {
      return Container(
        alignment: const Alignment(0, 0),
        child: Text(
          "No any Wishlist is present ..!",
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
        itemCount: listWishlist.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              firstName(index)!,
              Center(
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        packageBooking.clear();
                        QuerySnapshot response = await FirebaseFirestore
                            .instance
                            .collection('SpecificHotel')
                            .get();
                        for (int i = 0; i < response.docs.length; i++) {
                          if (response.docs[i]['name'] ==
                              listWishlist[index]['name']) {
                            packageBooking.add({
                              'name': response.docs[i]['name'],
                              'image1': response.docs[i]['image1'],
                              'image2': response.docs[i]['image2'],
                              'image3': response.docs[i]['image3'],
                              'holidayName': response.docs[i]['holidayName'],
                              'nightCity': response.docs[i]['nightCity'],
                              'startLoc': response.docs[i]['startLoc'],
                              'endLoc': response.docs[i]['endLoc'],
                              'startTime': response.docs[i]['startTime'],
                              'endTime': response.docs[i]['endTime'],
                              'startDate': response.docs[i]['startDate'],
                              'endDate': response.docs[i]['endDate'],
                              'price': response.docs[i]['price'],
                              'similarName': response.docs[i]['similarName'],
                              'overview': response.docs[i]['overview'],
                              'details': response.docs[i]['details'],
                              'similar': response.docs[i]['similar'],
                              'downImg1': response.docs[i]['downImg1'],
                              'downImg2': response.docs[i]['downImg2'],
                            });
                            String normalVar = response.docs[i]['split'];
                            splitC2W.clear();
                            splitC2W = normalVar.split('C2WShashiSir');
                            break;
                          }
                        }
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Packagebookingpage(),
                          ),
                        );
                      },
                      child: Container(
                        width: 300,
                        margin: const EdgeInsets.only(
                          bottom: 20,
                          top: 20,
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
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                              height: 125,
                              width: MediaQuery.of(context).size.width,
                              child: Image.asset(
                                listWishlist[index]['images'],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Row(
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
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    listWishlist[index]['name'],
                                    style: GoogleFonts.aBeeZee(
                                      textStyle: const TextStyle(
                                          fontSize: 13,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  listWishlist[index]['price'],
                                  style: GoogleFonts.aBeeZee(
                                    textStyle: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  listWishlist[index]['night'],
                                  style: GoogleFonts.aBeeZee(
                                    textStyle: const TextStyle(fontSize: 13),
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  "per person",
                                  style: GoogleFonts.aBeeZee(
                                    textStyle: const TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 25,
                      right: 10,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                log("$listWishlist");

                                QuerySnapshot response = await FirebaseFirestore
                                    .instance
                                    .collection('WishList')
                                    .get();
                                for (int i = 0; i < response.docs.length; i++) {
                                  if ((listWishlist[index]['name'] ==
                                          response.docs[i]['name']) &&
                                      (listWishlist[index]['username'] ==
                                          response.docs[i]['username'])) {
                                    await FirebaseFirestore.instance
                                        .collection("WishList")
                                        .doc(response.docs[i].id)
                                        .delete();
                                    // listWishlist.removeAt(index);
                                  }
                                }

                                bool check = false;
                                for (int i = 0; i < 2; i++) {
                                  for (int j = 0;
                                      j < packagesList[i].length;
                                      j++) {
                                    if (packagesList[i][j]['name'] ==
                                        listWishlist[index]['name']) {
                                      iconColorList[i][j]['colour'] =
                                          Colors.black;
                                      iconColorList[i][j]['icon'] =
                                          Icons.favorite_outline;
                                      listWishlist.removeAt(index);
                                      check = true;
                                      break;
                                    }
                                  }
                                  if (check) {
                                    break;
                                  }
                                }

                                log("$listWishlist");
                                setState(() {});
                              },
                              child: const Icon(
                                Icons.favorite,
                                size: 25,
                                color: Colors.pink,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
    }
  }

  // function created by clicking icons changes
  void onTapItems(int index) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Wishlist",
          style: GoogleFonts.quicksand(
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            home = true;
            wishlist = true;
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              ModalRoute.withName(''),
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 65, 21, 141),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: returnToggle(),
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
            label: 'Home',
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
