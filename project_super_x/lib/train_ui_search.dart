import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_screen/payment_confirmed.dart';
import 'package:home_screen/paymentmethod.dart';

List<Map<String, dynamic>> trainList = [];

String? start;
String? end;

String trainBooking = "";

class TrainListPage extends StatelessWidget {
  const TrainListPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget retBody() {
      if (trainList.isNotEmpty) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(
                        start!,
                        style: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 65, 21, 141),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_right_alt_outlined,
                        size: 50,
                        color: Color.fromARGB(255, 65, 21, 141),
                      ),
                      Text(
                        end!,
                        style: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromARGB(255, 65, 21, 141),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: trainList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 65, 21, 141),
                          border: Border.all(
                            color: const Color.fromARGB(255, 65, 21, 141),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    trainList[index]["trainNo"],
                                    style: GoogleFonts.quicksand(
                                        color: Colors.white),
                                  ),
                                  const Icon(
                                    Icons.arrow_right_alt_outlined,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    trainList[index]["trainName"],
                                    style: GoogleFonts.quicksand(
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 242, 238, 238),
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 242, 238, 238),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Text(
                                              trainList[index]["trainNo"],
                                              style: GoogleFonts.quicksand(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Expanded(
                                          child: Text(
                                            trainList[index]["trainName"],
                                            style: GoogleFonts.quicksand(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                        // const Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            trainBooking = "Train Booking";
                                            amountGPay =
                                                trainList[index]['price'];
                                            type = 'Train';
                                            type2 =
                                                trainList[index]['trainName'];
                                            type3 =
                                                "${trainList[index]['departFrom']} - ${trainList[index]['goingTo']}";
                                            type4 = trainList[index]['date'];
                                            type5 =
                                                "Train : ${trainList[index]['price']}";

                                            print(type2);
                                            print(type3);
                                            print(type4);
                                            print(type5);

                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const PaymentMethod()),
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: const Color.fromARGB(
                                                  255, 65, 21, 141),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20,
                                                  right: 20,
                                                  top: 5,
                                                  bottom: 5),
                                              child: Text(
                                                "pay",
                                                style: GoogleFonts.quicksand(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            trainList[index]["trainStartTime"],
                                            style: GoogleFonts.quicksand(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            trainList[index]["trainTotalTime"],
                                            style: GoogleFonts.quicksand(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            trainList[index]["trainEndTime"],
                                            style: GoogleFonts.quicksand(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                trainList[index]["departFrom"],
                                                style: GoogleFonts.quicksand(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                trainList[index]["price"],
                                                style: GoogleFonts.quicksand(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Column(
                                            children: [
                                              Text(
                                                trainList[index]["goingTo"],
                                                style: GoogleFonts.quicksand(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                trainList[index]["date"],
                                                style: GoogleFonts.quicksand(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      } else {
        return Center(
          child: Text(
            "No trains are available ..!",
            style: GoogleFonts.aBeeZee(
              textStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 65, 21, 141),
        title: Text(
          "Available Trains",
          style: GoogleFonts.quicksand(
              color: Colors.white,
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: retBody(),
    );
  }
}
