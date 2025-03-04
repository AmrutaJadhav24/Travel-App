import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_screen/payment_confirmed.dart';
import 'package:home_screen/paymentmethod.dart';

///hotel third page

String? checkIn;
String? checkOut;

class Hoteldetailspage extends StatefulWidget {
  const Hoteldetailspage({super.key});

  @override
  State<Hoteldetailspage> createState() => _HoteldetailspageState();
}

List<Map<String, dynamic>> hotelsInfor = [];
List<Map<String, dynamic>> amenitiesIconList = [
  {
    'hotelName': "Spree Shivai Hotel Pimpri",
    'icon1': Icons.restaurant,
    'icon2': Icons.wifi,
    'icon3': Icons.newspaper,
    'icon4': Icons.business,
    'icon5': Icons.local_cafe,
    'icon6': Icons.people,
    'icon7': Icons.business_center,
    'icon8': Icons.local_laundry_service,
  },
  {
    'hotelName': "Zip By Spree Hotels Chakan",
    'icon1': Icons.restaurant,
    'icon2': Icons.wifi,
    'icon3': Icons.newspaper,
    'icon4': Icons.business,
    'icon5': Icons.fire_extinguisher,
    'icon6': Icons.people,
    'icon7': Icons.business_center,
    'icon8': Icons.local_laundry_service,
  },
  {
    'hotelName': "Hotel Parc Estique",
    'icon1': Icons.sports_gymnastics,
    'icon2': Icons.luggage,
    'icon3': Icons.newspaper,
    'icon4': Icons.business,
    'icon5': Icons.fire_extinguisher,
    'icon6': Icons.people,
    'icon7': Icons.business_center,
    'icon8': Icons.local_cafe,
  },
  {
    'hotelName': "Ramee Grand Hotel And Spa,Pune",
    'icon1': Icons.pool,
    'icon2': Icons.luggage,
    'icon3': Icons.newspaper,
    'icon4': Icons.local_parking,
    'icon5': Icons.sports_gymnastics,
    'icon6': Icons.spa,
    'icon7': Icons.business_center,
    'icon8': Icons.local_cafe,
  },
  {
    'hotelName': "Ar Suites Jewels Royale",
    'icon1': Icons.restaurant,
    'icon2': Icons.wifi,
    'icon3': Icons.newspaper,
    'icon4': Icons.business,
    'icon5': Icons.local_cafe,
    'icon6': Icons.people,
    'icon7': Icons.business_center,
    'icon8': Icons.local_laundry_service,
  },
  {
    'hotelName': "Vivanta Pune,Hinjawadi",
    'icon1': Icons.ac_unit,
    'icon2': Icons.wifi,
    'icon3': Icons.pets,
    'icon4': Icons.tv,
    'icon5': Icons.local_cafe,
    'icon6': Icons.fitness_center,
    'icon7': Icons.business_center,
    'icon8': Icons.restaurant,
  },
  {
    'hotelName': "Pride Plaza Hotel,Delhi",
    'icon1': Icons.sports_gymnastics,
    'icon2': Icons.luggage,
    'icon3': Icons.newspaper,
    'icon4': Icons.business,
    'icon5': Icons.fire_extinguisher,
    'icon6': Icons.people,
    'icon7': Icons.business_center,
    'icon8': Icons.local_cafe,
  },
  {
    'hotelName': "The Suryaa New Delhi",
    'icon1': Icons.restaurant,
    'icon2': Icons.wifi,
    'icon3': Icons.newspaper,
    'icon4': Icons.business,
    'icon5': Icons.local_cafe,
    'icon6': Icons.people,
    'icon7': Icons.business_center,
    'icon8': Icons.local_laundry_service,
  },
  {
    'hotelName': "Welcomehotel By ITC Hotels",
    'icon1': Icons.ac_unit,
    'icon2': Icons.wifi,
    'icon3': Icons.pets,
    'icon4': Icons.tv,
    'icon5': Icons.local_cafe,
    'icon6': Icons.fitness_center,
    'icon7': Icons.business_center,
    'icon8': Icons.restaurant,
  },
  {
    'hotelName': "Taj Palace New Delhi",
    'icon1': Icons.pool,
    'icon2': Icons.luggage,
    'icon3': Icons.newspaper,
    'icon4': Icons.local_parking,
    'icon5': Icons.sports_gymnastics,
    'icon6': Icons.spa,
    'icon7': Icons.business_center,
    'icon8': Icons.local_cafe,
  },
  {
    'hotelName': "The Park New Delhi",
    'icon1': Icons.sports_gymnastics,
    'icon2': Icons.luggage,
    'icon3': Icons.newspaper,
    'icon4': Icons.business,
    'icon5': Icons.fire_extinguisher,
    'icon6': Icons.people,
    'icon7': Icons.business_center,
    'icon8': Icons.local_cafe,
  },
  {
    'hotelName': "Sun-N-Sand Hotel",
    'icon1': Icons.sports_gymnastics,
    'icon2': Icons.luggage,
    'icon3': Icons.newspaper,
    'icon4': Icons.business,
    'icon5': Icons.fire_extinguisher,
    'icon6': Icons.people,
    'icon7': Icons.business_center,
    'icon8': Icons.local_cafe,
  },
  {
    'hotelName': "Tradient Narian Point",
    'icon1': Icons.restaurant,
    'icon2': Icons.wifi,
    'icon3': Icons.newspaper,
    'icon4': Icons.business,
    'icon5': Icons.local_cafe,
    'icon6': Icons.people,
    'icon7': Icons.business_center,
    'icon8': Icons.local_laundry_service,
  },
  {
    'hotelName': "The Paradise By Tunga",
    'icon1': Icons.pool,
    'icon2': Icons.luggage,
    'icon3': Icons.newspaper,
    'icon4': Icons.local_parking,
    'icon5': Icons.sports_gymnastics,
    'icon6': Icons.spa,
    'icon7': Icons.business_center,
    'icon8': Icons.local_cafe,
  },
  {
    'hotelName': "The Taj Mahal Palace Mumbai",
    'icon1': Icons.ac_unit,
    'icon2': Icons.wifi,
    'icon3': Icons.pets,
    'icon4': Icons.tv,
    'icon5': Icons.local_cafe,
    'icon6': Icons.fitness_center,
    'icon7': Icons.business_center,
    'icon8': Icons.restaurant,
  },
  {
    'hotelName': "Taj Lands End,Mumbai",
    'icon1': Icons.restaurant,
    'icon2': Icons.wifi,
    'icon3': Icons.newspaper,
    'icon4': Icons.business,
    'icon5': Icons.local_cafe,
    'icon6': Icons.people,
    'icon7': Icons.business_center,
    'icon8': Icons.local_laundry_service,
  },
];

class _HoteldetailspageState extends State<Hoteldetailspage> {
  List<String> roomImages = [];
  IconData? returnIcon(String iconKey) {
    for (int i = 0; true; i++) {
      if (amenitiesIconList[i]['hotelName'] == hotelsInfor[0]['hotelName']) {
        return amenitiesIconList[i][iconKey];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    roomImages.clear();
    roomImages.add(hotelsInfor[0]['room1']);
    roomImages.add(hotelsInfor[0]['room2']);
    roomImages.add(hotelsInfor[0]['room3']);
    roomImages.add(hotelsInfor[0]['room4']);
    roomImages.add(hotelsInfor[0]['room5']);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          hotelsInfor[0]['name'],
          style: GoogleFonts.quicksand(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            roomImages.clear();
            hotelsInfor.clear();
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 65, 21, 141),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 350,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                itemCount: roomImages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 1,
                      right: 1,
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 30, right: 1),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        // color: Colors.amber,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            spreadRadius: 1,
                            blurRadius: 25,
                            offset: const Offset(3, 5),
                          ),
                        ],
                      ),
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        margin: const EdgeInsets.only(
                          bottom: 15,
                          left: 8,
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        // Decreased width
                        child: Image.asset(
                          roomImages[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Swipe left or right to view more images",
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              // height: 300, // Set height for the circular container
              //width: 340, // Set width for the circular container
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:
                    Colors.white, // Background color for the circular container
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              hotelsInfor[0][
                                  'hotelName'], // Text inside the circular container
                              style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment
                                .start, // Center text vertically
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, top: 20),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    hotelsInfor[0]['address'],
                                    style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          // Center text vertically
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 20,
                                left: 12,
                              ),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "Very Good", // Second column text
                                  style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Colors.amber,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Colors.amber,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Colors.amber,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Colors.amber,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Colors.grey,
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10), // Add some spacing
                    const Divider(
                      thickness: 1, // Thickness of the divider
                      color: Colors.grey, // Color of the divider
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Travel Dates and Guests",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          hotelsInfor[0]['nightRoomGuest'],
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            width: 140,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  const Icon(
                                    Icons.watch_later,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    "Check In",
                                    style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    hotelsInfor[0]['startTime'],
                                    style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    checkIn!,
                                    style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 140,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  const Icon(
                                    Icons.watch_later_outlined,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    "Check Out",
                                    style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    hotelsInfor[0]['endTime'],
                                    style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    checkOut!,
                                    style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
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
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Amenities",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      returnIcon('icon1'),
                      size: 24,
                    ),
                    title: Text(
                      hotelsInfor[0]['amenities1'],
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      returnIcon('icon2'),
                      size: 24,
                    ),
                    title: Text(
                      hotelsInfor[0]['amenities2'],
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      returnIcon('icon3'),
                      size: 24,
                    ),
                    title: Text(hotelsInfor[0]['amenities3']),
                  ),
                  ListTile(
                    leading: Icon(
                      returnIcon('icon4'),
                      size: 24,
                    ),
                    title: Text(
                      hotelsInfor[0]['amenities4'],
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      returnIcon('icon5'),
                      size: 24,
                    ), // Coffee Shop icon
                    title: Text(
                      hotelsInfor[0]['amenities5'],
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      returnIcon('icon6'),
                      size: 24,
                    ), // Front Desk icon
                    title: Text(
                      hotelsInfor[0]['amenities6'],
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      returnIcon('icon7'),
                      size: 24,
                    ), // Conference Hall icon
                    title: Text(hotelsInfor[0]['amenities7']),
                  ),
                  ListTile(
                    leading:
                        Icon(returnIcon('icon8'), size: 24), // Laundry icon
                    title: Text(
                      hotelsInfor[0]['amenities8'],
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      hotelsInfor[0]['price'], // Amount text
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),

                  const Spacer(),
                  // Add ElevatedButton
                  ElevatedButton(
                    onPressed: () {
                      // Add your onPressed code here
// sdyuyd
                      type2 = hotelsInfor[0]['hotelName'];
                      type3 = hotelsInfor[0]['name'];
                      type4 = "$checkIn - $checkOut";
                      type5 = "Hotel : ${hotelsInfor[0]['price']}";
                      amountGPay = hotelsInfor[0]['price'];
                      print(type2);
                      print(type3);
                      print(type4);
                      print(type5);
                      print(amountGPay);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PaymentMethod(),
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          255, 65, 21, 141), // Background color
                    ),
                    child: Text(
                      "Book Now",
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ), // Spacing below the button
          ],
        ),
      ),
    );
  }
}
