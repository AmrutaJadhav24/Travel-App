// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'loginpage.dart';
import 'main.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  State createState() => _SignUpState();
}

class _SignUpState extends State {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();

  bool ispasswordVisible = false;
  bool isCondition = true;

  Icon? returnIcon() {
    if (isCondition) {
      return null;
    } else {
      return const Icon(
        color: Color.fromARGB(255, 14, 123, 17),
        Icons.check_circle_rounded,
        size: 22,
      );
    }
  }

  void fillData() async {
    bool isNew = true;
    String name = nameController.text;
    String username = usernameController.text;
    String password = passwordController.text;
    String email = emailController.text;
    String mobileNo = mobileNoController.text;
    if (name.trim().isEmpty ||
        username.trim().isEmpty ||
        password.trim().isEmpty ||
        email.trim().isEmpty ||
        mobileNo.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill all the field"),
          backgroundColor: Colors.red,
        ),
      );
      isNew = false;
    } else if (isCondition) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please accept terms & condition"),
          backgroundColor: Colors.red,
        ),
      );
      isNew = false;
    } else {
      // Name
      for (int i = 0; i < name.length; i++) {
        int asciiCode = name.codeUnitAt(i);
        if ((asciiCode < 65 || asciiCode > 90) &&
            (asciiCode < 97 || asciiCode > 122) &&
            asciiCode != 32) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Name cant be a special character or number"),
              backgroundColor: Colors.red,
            ),
          );
          isNew = false;
          nameController.clear();
          break;
        }
      }

      // Username
      if (username.contains(' ')) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Username should not have space"),
            backgroundColor: Colors.red,
          ),
        );
        isNew = false;
      }

      // Password
      if (!password.contains(RegExp(r'[a-z]')) ||
          !password.contains(RegExp(r'[A-Z]')) ||
          !password.contains(RegExp(r'[0-9]')) ||
          !password.contains(RegExp(r'[!-/ && @]')) ||
          password.length < 7) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Password must be greater than 6 including uppercase, lowercase, number & special character",
            ),
            backgroundColor: Colors.red,
          ),
        );
        isNew = false;
        passwordController.clear();
      }

      //email
      if (!email.contains('@') || !email.contains('gmail.com')) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please enter valid email"),
            backgroundColor: Colors.red,
          ),
        );
        isNew = false;
      }

      //Mobile Number
      for (int i = 0; i < mobileNo.length; i++) {
        if (mobileNo.length != 10) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Invalid Mobile Number"),
              backgroundColor: Colors.red,
            ),
          );
          isNew = false;
          break;
        }
        if (mobileNo.codeUnitAt(i) < 48 || mobileNo.codeUnitAt(i) > 57) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Mobile Number never be special character"),
              backgroundColor: Colors.red,
            ),
          );
          isNew = false;
          break;
        }
      }
    }

    // If exist or not
    for (int i = 0; i < userInformation.length; i++) {
      if (userInformation[i]["username"] == username) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Username is already exist, Please login or enter unique username",
            ),
            backgroundColor: Colors.red,
          ),
        );
        isNew = false;
        break;
      }
    }

    // New Data or not
    if (isNew) {
      // insertUserData({
      //   "name": name,
      //   "username": username,
      //   "password": password,
      //   "email": email,
      //   "mobileNo": mobileNo
      // });

      // Inserted Data in SQFLite
      // userInformation = await showDataAll();

      // Firebase Storage code
      await FirebaseFirestore.instance.collection('SignUpInfo').add({
        "name": name,
        "username": username,
        "password": password,
        "email": email,
        "mobileNo": mobileNo
      });

      QuerySnapshot response =
          await FirebaseFirestore.instance.collection('SignUpInfo').get();

      userInformation.clear();

      for (int i = 0; i < response.docs.length; i++) {
        userInformation.add({
          'email': response.docs[i]['email'],
          'mobileNo': response.docs[i]['mobileNo'],
          'name': response.docs[i]['name'],
          'password': response.docs[i]['password'],
          'username': response.docs[i]['username']
        });
      }

      log("UserInfo : $userInformation");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text("Successfully Registered, Please login to our application"),
          backgroundColor: Colors.green,
        ),
      );
      nameController.clear();
      usernameController.clear();
      passwordController.clear();
      emailController.clear();
      mobileNoController.clear();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(
              //top: 50,
              bottom: 20,
              left: 20,
              right: 20,
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Sign Up Title
                Text(
                  "Sign Up",
                  style: GoogleFonts.quicksand(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                // Create account title
                Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: Text(
                    "Create your account",
                    style: GoogleFonts.quicksand(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Name Textfield
                TextField(
                  style: GoogleFonts.aBeeZee(),
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Name",
                    labelStyle: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(
                      Icons.person,
                      size: 20,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                // Username Textfield
                TextField(
                  controller: usernameController,
                  style: GoogleFonts.aBeeZee(),
                  decoration: InputDecoration(
                    labelText: "Username",
                    labelStyle: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(
                      Icons.person_outlined,
                      size: 20,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                // Password Textfield
                TextField(
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
                    prefixIcon: const Icon(
                      Icons.lock,
                      size: 20,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        ispasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        ispasswordVisible = !ispasswordVisible;
                        setState(() {});
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                // Email TextField
                TextField(
                  style: GoogleFonts.aBeeZee(),
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(
                      Icons.attach_email_rounded,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                // Mobile TextField
                TextField(
                  keyboardType: TextInputType.phone,
                  style: GoogleFonts.aBeeZee(),
                  controller: mobileNoController,
                  decoration: InputDecoration(
                    labelText: "Mobile Number",
                    labelStyle: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(
                      Icons.phone,
                      size: 20,
                    ),
                  ),
                  maxLength: 10,
                ),
                const SizedBox(
                  height: 30,
                ),

                // Terms & Conditions
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        isCondition = !isCondition;
                        setState(() {});
                      },
                      child: Container(
                        height: 25,
                        width: 25,
                        margin: const EdgeInsets.only(
                          right: 5,
                        ),
                        alignment: const Alignment(0, 0),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                        ),
                        child: returnIcon(),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        isCondition = !isCondition;
                        setState(() {});
                      },
                      child: Text(
                        "I accept all Terms and Conditions",
                        style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),

                // SignUp Button
                GestureDetector(
                  onTap: () {
                    fillData();
                    setState(() {});
                  },
                  child: Container(
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 65, 21, 141),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Signup",
                        style: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                // Login Navigate Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: GoogleFonts.quicksand(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: Text(
                        "login",
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: const Color.fromARGB(255, 65, 21, 141),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
