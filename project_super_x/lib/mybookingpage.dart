import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_screen/home_screen.dart';
import 'package:home_screen/profile.dart';
import 'package:home_screen/transaction.dart';
import 'package:home_screen/wishlistpage.dart';

class MyBookingsPage extends StatefulWidget {
  const MyBookingsPage({super.key});

  @override
  State<MyBookingsPage> createState() => _MyBookingPageState();
}

List<Map<String, dynamic>> bookings = [];
class _MyBookingPageState extends State<MyBookingsPage> {
  int selectedIndex = 0;

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
    List<Map<String, dynamic>> filteredBookings = selectedIndex == 0
        ? bookings
        : bookings
            .where(
              (booking) =>
                  booking['type'] ==
                  (selectedIndex == 1
                      ? 'Flight'
                      : selectedIndex == 2
                          ? 'Train'
                          : selectedIndex == 3
                              ? 'Travel'
                              : 'Hotels'),
            )
            .toList();

    Widget returnListOfBook() {
      if (filteredBookings.isEmpty) {
        return Container(
          alignment: const Alignment(0, 0),
          child: Text(
            "No any list presented ..!",
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
          itemCount: filteredBookings.length,
          itemBuilder: (context, index) {
            final booking = filteredBookings[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Displaying icon based on booking type
                    if (booking['type'] == 'Flight')
                      const Icon(
                        Icons.flight,
                        color: Colors.blue,
                        size: 30,
                      ),
                    if (booking['type'] == 'Train')
                      const Icon(
                        Icons.train,
                        color: Colors.green,
                        size: 30,
                      ),
                    if (booking['type'] == 'Travel')
                      const Icon(
                        Icons.directions_bus,
                        color: Colors.orange,
                        size: 30,
                      ),
                    if (booking['type'] == 'Hotels')
                      const Icon(
                        Icons.hotel,
                        color: Colors.red,
                        size: 30,
                      ),
                    if (booking['type'] == 'Package')
                      const Icon(
                        Icons.trip_origin_outlined,
                        color: Colors.amber,
                        size: 30,
                      ),
                    const SizedBox(width: 10),

                    // Booking details
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            booking['dest'],
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: 230,
                          child: Text(
                            booking['port']!,
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        SizedBox(
                          width: 230,
                          child: Text(
                            booking['date']!,
                            style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          booking['name']!,
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(4),
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(4),
                      //   color: Colors.amber,
                      // ),
                      child: const Icon(
                        Icons.check_circle,
                        size: 30,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Bookings",
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
            booking = true;
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
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        'All',
                        style: GoogleFonts.quicksand(
                          textStyle: TextStyle(
                            fontSize: 15,
                            color: selectedIndex == 0
                                ? Colors.deepPurple
                                : Colors.black,
                            fontWeight: selectedIndex == 0
                                ? FontWeight.w800
                                : FontWeight.bold,
                          ),
                        ),
                      ),
                      if (selectedIndex == 0)
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          height: 2,
                          width: 20,
                          color: Colors.deepPurple,
                        ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        'Flight',
                        style: GoogleFonts.quicksand(
                          textStyle: TextStyle(
                            fontSize: 15,
                            color: selectedIndex == 1
                                ? Colors.deepPurple
                                : Colors.black,
                            fontWeight: selectedIndex == 1
                                ? FontWeight.w800
                                : FontWeight.bold,
                          ),
                        ),
                      ),
                      if (selectedIndex == 1)
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          height: 2,
                          width: 20,
                          color: Colors.deepPurple,
                        ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 2;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        'Train',
                        style: GoogleFonts.quicksand(
                          textStyle: TextStyle(
                            color: selectedIndex == 2
                                ? Colors.deepPurple
                                : Colors.black,
                            fontWeight: selectedIndex == 2
                                ? FontWeight.w800
                                : FontWeight.bold,
                          ),
                        ),
                      ),
                      if (selectedIndex == 2)
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          height: 2,
                          width: 20,
                          color: Colors.deepPurple,
                        ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 3;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        'Travel',
                        style: GoogleFonts.quicksand(
                          textStyle: TextStyle(
                            color: selectedIndex == 3
                                ? Colors.deepPurple
                                : Colors.black,
                            fontWeight: selectedIndex == 3
                                ? FontWeight.w800
                                : FontWeight.bold,
                          ),
                        ),
                      ),
                      if (selectedIndex == 3)
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          height: 2,
                          width: 20,
                          color: Colors.deepPurple,
                        ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 4;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        'Hotel',
                        style: GoogleFonts.quicksand(
                          textStyle: TextStyle(
                            fontSize: 15,
                            color: selectedIndex == 4
                                ? Colors.deepPurple
                                : Colors.black,
                            fontWeight: selectedIndex == 4
                                ? FontWeight.w800
                                : FontWeight.bold,
                          ),
                        ),
                      ),
                      if (selectedIndex == 4)
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          height: 2,
                          width: 20,
                          color: Colors.deepPurple,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: returnListOfBook(),
          ),
        ],
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
