import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_screen/home_screen.dart';
import 'package:home_screen/mybookingpage.dart';
import 'package:home_screen/profile.dart';
import 'package:home_screen/wishlistpage.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({super.key});

  @override
  State createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State {
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
  Widget returnTrans(){
    if(bookings.isEmpty){
      return Container(
        alignment: const Alignment(0, 0),
        child: Text(
          "No any transaction ..!",
          style: GoogleFonts.aBeeZee(
            textStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }else{
      return ListView.builder(
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          String name = bookings[index]['name'];
          List<String> slpitThePrice = name.split('₹');
          List<String> slpitThePrice1 = name.split(':');
          return Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 238, 237, 232),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    bookings[index]['image'],
                    height: 50,
                    width: 50,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 180,
                      // color: Colors.amber,
                      child: Text(
                        "${bookings[index]['dest']}",
                        style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${slpitThePrice1[0]}Bookings",
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "₹${slpitThePrice[1]}",
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Container(
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 202, 231, 203),
                      ),
                      child: Center(
                        child: Text(
                          "Success",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                              color: Colors.green,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "25 Nov 2024",
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Transaction History",
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
            transaction = true;
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
      body: returnTrans(),
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
