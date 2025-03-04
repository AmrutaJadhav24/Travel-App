import "dart:developer";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:home_screen/home_screen.dart";
import "package:home_screen/rateus.dart";
import "package:home_screen/splashscreen.dart";
import "package:home_screen/wishlistpage.dart";
import "package:sqflite/sqflite.dart";

dynamic database;

void insertWishlistData(Map<String, dynamic> userDetails) async {
  Database localDB = await database;
  await localDB.insert(
    "Wishlist",
    userDetails,
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Map<String, dynamic>>> showData(String usernameLoc) async {
  Database localDB = await database;
  return await localDB.query(
    "Wishlist",
    where: "usernameLocation = ?",
    whereArgs: [usernameLoc],
  );
}

Future<List<Map<String, dynamic>>> showDataAll() async {
  Database localDB = await database;
  return await localDB.query(
    "Wishlist",
  );
}

Future<int> deleteData(String locationName, String username) async {
  Database localDB = await database;
  return await localDB.delete(
    "Wishlist",
    where: "name = ? AND username = ?",
    whereArgs: [locationName, username],
  );
}

Future<int> deleteProfileData(String mobileNo) async {
  Database localDB = await database;
  return await localDB.delete(
    "Profile",
    where: "mobileNo = ?",
    whereArgs: [mobileNo],
  );
}

List<Map<String, dynamic>> userInformation = [];
List<List<Map<String, dynamic>>> packagesList = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyA_F_3of3EE2pmTi_R3pbedjT6ryhIJm40",
      appId: "1:287694229725:android:f14e60771c133699b1cb34",
      messagingSenderId: "287694229725",
      projectId: "tripnavigator-5074e",
    ),
  );

  QuerySnapshot response1 =
      await FirebaseFirestore.instance.collection('PackageList').get();
  int first = 0;
  int second = 1;
  int third = 2;
  int fourth = 3;
  int fifth = 4;
  packagesList.clear();
  for (int i = 0; i < 2; i++) {
    packagesList.add([
      {
        "name": response1.docs[first]['name'],
        "images": response1.docs[first]['images'],
        "night": response1.docs[first]['night'],
        "price": response1.docs[first]['price']
      },
      {
        "name": response1.docs[second]['name'],
        "images": response1.docs[second]['images'],
        "night": response1.docs[second]['night'],
        "price": response1.docs[second]['price']
      },
      {
        "name": response1.docs[third]['name'],
        "images": response1.docs[third]['images'],
        "night": response1.docs[third]['night'],
        "price": response1.docs[third]['price']
      },
      {
        "name": response1.docs[fourth]['name'],
        "images": response1.docs[fourth]['images'],
        "night": response1.docs[fourth]['night'],
        "price": response1.docs[fourth]['price']
      },
      {
        "name": response1.docs[fifth]['name'],
        "images": response1.docs[fifth]['images'],
        "night": response1.docs[fifth]['night'],
        "price": response1.docs[fifth]['price']
      },
    ]);
    first = first + 5;
    second = second + 5;
    third = third + 5;
    fourth = fourth + 5;
    fifth = fifth + 5;
  }

  log("$packagesList");

  // Wishlist Data from sqflite
  // profileInfo = await showProfDataAll(); /////Error

  int value = 0;
  for (int l = 0; l < listWishlist.length; l++) {
    for (int i = 0; i < 2; i++) {
      for (int j = 0; j < iconColorList[i].length; j++) {
        if (listWishlist.length != value) {
          if (packagesList[i][j]['name'] == listWishlist[value]['name']) {
            iconColorList[i][j]['icon'] = Icons.favorite;
            iconColorList[i][j]['colour'] = Colors.pink;
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

  // UserInformation Added
  QuerySnapshot response =
      await FirebaseFirestore.instance.collection('SignUpInfo').get();

  userInformation.clear();
  for (int i = 0; i < response.docs.length; i++) {
    userInformation.add({
      'email': response.docs[i]['email'],
      'mobileNo': response.docs[i]['mobileNo'],
      'name': response.docs[i]['name'],
      'password': response.docs[i]['password'],
      'username': response.docs[i]['username'],
    });
  }

  addReview();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
