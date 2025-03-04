import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_screen/wishlistpage.dart';
import 'forgot_password.dart';
import 'home_screen.dart';
import 'main.dart';
import 'sign_up.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool ispasswordVisible = false;

  void _login() async {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please Enter Username or Password'),
          backgroundColor: Colors.red,
        ),
      );
    } else if (username.trim().isEmpty || password.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid entry for Username or Password'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      if (userInformation.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                "Don't have an account please first Signup, to create account"),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        QuerySnapshot response =
            await FirebaseFirestore.instance.collection('SignUpInfo').get();
        userInformation.clear();
        for (int i = 0; i < response.docs.length; i++) {
          userInformation.add({
            'name': response.docs[i]['name'],
            'mobileNo': response.docs[i]['mobileNo'],
            'username': response.docs[i]['username'],
            'email': response.docs[i]['email'],
            'password': response.docs[i]['password']
          });
        }
        for (int i = 0; i < userInformation.length; i++) {
          if (username.trim() == userInformation[i]["username"] &&
              password.trim() == userInformation[i]["password"]) {
            // deleteProfileData(userInformation[i][]);
            //  profileInfo.clear();
            //  profileInfo.add({
            //   'name' : userInformation[i]['name'],
            //   'mobileNo' : userInformation[i]['mobileNo'],
            //   'username' : userInformation[i]['username'],
            //   'email': userInformation[i]['email']
            //  });

            userInformation.insert(0, {
              'name': userInformation[i]['name'],
              'mobileNo': userInformation[i]['mobileNo'],
              'username': userInformation[i]['username'],
              'email': userInformation[i]['email'],
              'password': userInformation[i]['password']
            });

            for (int i = 1; i < userInformation.length; i++) {
              if (userInformation[0]['username'] ==
                  userInformation[i]['username']) {
                userInformation.removeAt(i);
              }
            }

            // print(listWishlist[0]['username']);
            // print(username);
            // List<Map<String, dynamic>> usernameCheck = await showData(username);
            // print(usernameCheck);

            // String userLoc = "$username${userInformation[0]['location']}";
            // print("UserLocation : $userLoc");
            // listWishlist = await showDataAll();
            print("Listwishlist : $listWishlist");
            for (int i = 0; i < 2; i++) {
              for (int j = 0; j < 5; j++) {
                iconColorList[i][j]['icon'] = Icons.favorite_outline;
                iconColorList[i][j]['colour'] = Colors.black;
                iconColorList[i][j]['value'] = true;
              }
            }

            QuerySnapshot response =
                await FirebaseFirestore.instance.collection('WishList').get();
            bool check = true;
            print(response.docs.length);
            listWishlist.clear();
            for (int i = 0; i < response.docs.length; i++) {
              if (username == response.docs[i]['username']) {
                print(response.docs[i]['username']);
                print(username);
                listWishlist.add({
                  'username': response.docs[i]['username'],
                  'images': response.docs[i]['images'],
                  'name': response.docs[i]['name'],
                  'night': response.docs[i]['night'],
                  'price': response.docs[i]['price'],
                });
                check = false;
              }
            }
            print(check);
            if (check) {
              listWishlist.clear();
              print(listWishlist);
            }

            log("Wishlist : $listWishlist");

            int value = 0;
            for (int l = 0; l < listWishlist.length; l++) {
              for (int i = 0; i < 2; i++) {
                for (int j = 0; j < iconColorList[i].length; j++) {
                  if (listWishlist.length != value) {
                    if ("${packagesList[i][j]['name']}" ==
                        listWishlist[value]['name']) {
                      iconColorList[i][j]['icon'] = Icons.favorite;
                      iconColorList[i][j]['colour'] = Colors.pink;
                      iconColorList[i][j]['value'] = false;
                      value++;
                    }
                  } else {
                    value = -1;
                    break;
                  }
                }
                if (value == -1) {
                  break;
                }
              }
              if (value == -1) {
                break;
              }
            }
            log("Wishlist : $listWishlist");
            print(response.docs.length);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Login Successfully..!"),
                backgroundColor: Colors.green,
              ),
            );
            print(userInformation);
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
              ModalRoute.withName(''),
            );
            // print("END");
            ispasswordVisible = false;
            break;
          }
          if (i == userInformation.length - 1) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Incorrect Username or Password"),
                backgroundColor: Colors.red,
              ),
            );
          }
        }
      }
    }
    setState(() {});
    // usernameController.clear();
    // passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Trip Navigator",
          style: GoogleFonts.quicksand(
            textStyle: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 65, 21, 141),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          right: 15,
          left: 15,
          bottom: 15,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Welcome title
                  Text(
                    "Welcome Back",
                    style: GoogleFonts.quicksand(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),

                  // Login Credential
                  Text(
                    "Enter your credential to login",
                    style: GoogleFonts.quicksand(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),

                  // Username Field
                  SizedBox(
                    width: 280,
                    child: TextField(
                      style: GoogleFonts.aBeeZee(),
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: "Username",
                        labelStyle: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.person),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // Password Field
                  SizedBox(
                    width: 280,
                    child: TextField(
                      style: GoogleFonts.aBeeZee(),
                      controller: passwordController,
                      obscureText: !ispasswordVisible,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            ispasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            // Toggle password visibility on tap
                            setState(
                              () {
                                ispasswordVisible = !ispasswordVisible;
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  // Login Button which navigate to HomePage
                  SizedBox(
                    height: 50,
                    width: 250,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 65, 21, 141),
                      ),
                      onPressed: _login,
                      child: Text(
                        "Login",
                        style: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),

                  // Forgot password Button
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ForgotPassword(),
                        ),
                      );
                      usernameController.clear();
                      passwordController.clear();
                    },
                    child: Text(
                      "Forgot password ?",
                      style: GoogleFonts.quicksand(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: const Color.fromARGB(255, 65, 21, 141),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  // SignUp Button to jump in previous page
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SignUp(),
                        ),
                      );
                      usernameController.clear();
                      passwordController.clear();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "Sign Up",
                          style: GoogleFonts.quicksand(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 65, 21, 141),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
