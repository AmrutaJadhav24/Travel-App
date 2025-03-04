import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_screen/home_screen.dart';
import 'package:home_screen/main.dart';
import 'package:home_screen/mybookingpage.dart';
import 'package:home_screen/transaction.dart';
import 'package:home_screen/wishlistpage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State createState() => _ProfilePageState();
}

class _ProfilePageState extends State {
  TextEditingController nameController =
      TextEditingController(text: userInformation[0]['name']);
  TextEditingController mobileNoController =
      TextEditingController(text: userInformation[0]['mobileNo']);
  TextEditingController usernameController =
      TextEditingController(text: userInformation[0]['username']);
  TextEditingController emailAddController =
      TextEditingController(text: userInformation[0]['email']);

  void checkEdited() {
    if (nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please Enter Name field"),
          backgroundColor: Colors.red,
        ),
      );
    } else if (mobileNoController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please Enter Mobile Number field"),
          backgroundColor: Colors.red,
        ),
      );
    } else if (usernameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please Enter Location field"),
          backgroundColor: Colors.red,
        ),
      );
    } else if (emailAddController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please Enter Email Address field"),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Changes Saved Successfully..!"),
          backgroundColor: Colors.green,
        ),
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  color: Color.fromARGB(255, 65, 21, 141),
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            home = true;
                            profile = true;
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()),
                              ModalRoute.withName(''),
                            );
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 2) - 100,
                        ),
                        Text(
                          "Edit Profile",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 15),
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 60,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 10,
                  left: 10,
                  top: 30,
                  bottom: 10,
                ),
                child: TextField(
                  enabled: false,
                  controller: usernameController,
                  style: GoogleFonts.aBeeZee(
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.supervised_user_circle,
                      size: 35,
                      color: Color.fromARGB(255, 65, 21, 141),
                    ),
                    labelText: 'Username',
                    labelStyle: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 10,
                  left: 10,
                  top: 10,
                  bottom: 10,
                ),
                child: TextField(
                  controller: nameController,
                  style: GoogleFonts.aBeeZee(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person,
                        size: 35, color: Color.fromARGB(255, 65, 21, 141)),
                    labelText: 'Name',
                    labelStyle: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 10,
                  left: 10,
                  top: 10,
                ),
                child: TextField(
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  controller: mobileNoController,
                  style: GoogleFonts.aBeeZee(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.phone,
                      size: 35,
                      color: Color.fromARGB(255, 65, 21, 141),
                    ),
                    labelText: 'Mobile Number',
                    labelStyle: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: TextField(
                  controller: emailAddController,
                  style: GoogleFonts.aBeeZee(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.email,
                      size: 35,
                      color: Color.fromARGB(255, 65, 21, 141),
                    ),
                    labelText: 'Email Address',
                    labelStyle: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  if (nameController.text.trim().isEmpty ||
                      mobileNoController.text.trim().isEmpty ||
                      usernameController.text.trim().isEmpty ||
                      emailAddController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Need to fill all the field",
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    bool check = true;

                    // Name checking
                    if (check) {
                      for (int i = 0; i < nameController.text.length; i++) {
                        int asciiCode = nameController.text.codeUnitAt(i);
                        if ((asciiCode < 65 || asciiCode > 90) &&
                            (asciiCode < 97 || asciiCode > 122) &&
                            asciiCode != 32) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  "Name cant be a special character or number"),
                              backgroundColor: Colors.red,
                            ),
                          );
                          check = false;
                          break;
                        }
                      }
                    }

                    // Mobile No
                    if (check) {
                      if (mobileNoController.text.length <= 9) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Invalid Mobile Number",
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                        check = false;
                      }
                    }

                    // emailAddress
                    if (check) {
                      if (!emailAddController.text.contains('@') ||
                          !emailAddController.text.contains('gmail.com')) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please enter valid email"),
                            backgroundColor: Colors.red,
                          ),
                        );
                        check = false;
                      }
                    }
                    if (check) {
                      if (nameController.text.trim() !=
                              userInformation[0]['name'] ||
                          mobileNoController.text.trim() !=
                              userInformation[0]['mobileNo'] ||
                          usernameController.text.trim() !=
                              userInformation[0]['username'] ||
                          emailAddController.text.trim() !=
                              userInformation[0]['email']) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Successfully Updated",
                            ),
                            backgroundColor: Colors.green,
                          ),
                        );
                        // Updating
                        QuerySnapshot response = await FirebaseFirestore
                            .instance
                            .collection('SignUpInfo')
                            .get();
                        for (int i = 0; i < response.docs.length; i++) {
                          if (response.docs[i]['username'] ==
                              userInformation[0]['username']) {
                            // Update data from firebase
                            await FirebaseFirestore.instance
                                .collection('SignUpInfo')
                                .doc(response.docs[i].id)
                                .update(
                              {
                                'name': nameController.text.trim(),
                                'mobileNo': mobileNoController.text.trim(),
                                'username': usernameController.text.trim(),
                                'email': emailAddController.text.trim()
                              },
                            );
                            break;
                          }
                        }
                        String password = userInformation[0]['password'];
                        userInformation.removeAt(0);
                        userInformation.insert(0, {
                          'name': nameController.text,
                          'mobileNo': mobileNoController.text,
                          'username': usernameController.text,
                          'email': emailAddController.text,
                          'password': password
                        });
                      }
                    }
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 40,
                  ),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 65, 21, 141),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 30,
                    right: 30,
                  ),
                  child: Text(
                    "Save Changes",
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
            ],
          ),
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
