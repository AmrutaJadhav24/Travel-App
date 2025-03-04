import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_screen/hotel_booking.dart';
import 'package:home_screen/hotel_page.dart';

/// hotel second page

class HotelListPage extends StatefulWidget {
  const HotelListPage({super.key});

  @override
  State createState() => _HotelListPageState();
}

List<Map<String, dynamic>> hotels = [];

class _HotelListPageState extends State<HotelListPage> {
  @override
  Widget build(BuildContext context) {
    // print(hotels);
    Widget returnHotelBody() {
      if (hotels.isEmpty) {
        return Container(
          alignment: const Alignment(0, 0),
          child: Text(
            "No any hotel is present..!",
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
          padding: const EdgeInsets.all(10),
          itemCount: hotels.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                QuerySnapshot response = await FirebaseFirestore.instance
                    .collection('HotelsInfo')
                    .get();
                hotelsInfor.clear();
                for (int i = 0; i < response.docs.length; i++) {
                  if (response.docs[i]["hotelName"] == hotels[index]['name']) {
                    hotelsInfor.add({
                      'name': response.docs[i]['name'],
                      'room1': response.docs[i]['room1'],
                      'room2': response.docs[i]['room2'],
                      'room3': response.docs[i]['room3'],
                      'room4': response.docs[i]['room4'],
                      'room5': response.docs[i]['room5'],
                      'hotelName': response.docs[i]['hotelName'],
                      'address': response.docs[i]['address'],
                      'nightRoomGuest': response.docs[i]['nightRoomGuest'],
                      'startTime': response.docs[i]['startTime'],
                      'endTime': response.docs[i]['endTime'],
                      'startDate': response.docs[i]['startDate'],
                      'endDate': response.docs[i]['endDate'],
                      'amenities1': response.docs[i]['amenities1'],
                      'amenities2': response.docs[i]['amenities2'],
                      'amenities3': response.docs[i]['amenities3'],
                      'amenities4': response.docs[i]['amenities4'],
                      'amenities5': response.docs[i]['amenities5'],
                      'amenities6': response.docs[i]['amenities6'],
                      'amenities7': response.docs[i]['amenities7'],
                      'amenities8': response.docs[i]['amenities8'],
                      'price': response.docs[i]['price'],
                    });
                    break;
                  }
                }

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Hoteldetailspage(),
                  ),
                );
              },
              child: Container(
                width: 500,
                height: 270,
                margin: const EdgeInsets.only(bottom: 20),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        margin: const EdgeInsets.only(bottom: 15, left: 8),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        height: 150,
                        width: 300,
                        child: Image.asset(
                          hotels[index]["image"],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            hotels[index]['name'],
                            style: GoogleFonts.aBeeZee(
                              textStyle: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          hotels[index]['price'],
                          style: GoogleFonts.aBeeZee(
                            textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      hotels[index]['location'],
                      style: GoogleFonts.aBeeZee(
                        color: Colors.amber,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          hotels[index]['duration'],
                          style: GoogleFonts.aBeeZee(
                            textStyle: const TextStyle(fontSize: 13),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "per person",
                          style: GoogleFonts.aBeeZee(
                            textStyle: const TextStyle(fontSize: 13),
                          ),
                        ),
                      ],
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
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HotelBooking(),
              ),
            );
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Hotels",
          style: GoogleFonts.quicksand(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 65, 21, 141),
      ),
      body: returnHotelBody(),
    );
  }
}
