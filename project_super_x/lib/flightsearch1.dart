import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_screen/flightdetails1.dart';
import 'package:home_screen/payment_confirmed.dart';

class FlightSearch1 extends StatefulWidget {
  final List flightListRT;
  const FlightSearch1({super.key, required this.flightListRT});

  @override
  State createState() => _FlightSearchState();
}

class _FlightSearchState extends State<FlightSearch1> {
  IconData? returnArrow() {
    if (widget.flightListRT.isEmpty) {
      return null;
    } else {
      return Icons.arrow_right_alt_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 65, 21, 141),
        title: Text(
          "Available Flights",
          style: GoogleFonts.quicksand(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.flightListRT.isNotEmpty
                        ? widget.flightListRT[0]['departFrom']
                        : '',
                    style: GoogleFonts.quicksand(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    returnArrow(),
                    size: 50,
                  ),
                  Text(
                    widget.flightListRT.isNotEmpty
                        ? widget.flightListRT[0]['goingTo']
                        : '',
                    style: GoogleFonts.quicksand(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              // Text(
              //   "Saturday,November 02,2024",
              //   style: GoogleFonts.quicksand(
              //     fontWeight: FontWeight.w600,
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
              widget.flightListRT.isEmpty
                  ? Container(
                      height: MediaQuery.of(context).size.height,
                      alignment: const Alignment(0, -0.3),
                      child: Text(
                        "No any flight available ..!",
                        style: GoogleFonts.aBeeZee(
                          textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: widget.flightListRT.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        widget.flightListRT[index];
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                              print(detailList1);
                              detailList1.clear();
                              print(widget.flightListRT[index]);
                              detailList1.add(widget.flightListRT[index]);
                              type2 =
                                  "${widget.flightListRT[index]['flightName']} - ${widget.flightListRT[index]['flightName1']}";
                              type3 =
                                  "${widget.flightListRT[index]['departFrom']} Port- ${widget.flightListRT[index]['goingTo']} Port";

                              type5 = "Two Way - ";
                              log("Before : ${detailList1}");
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const FlightDetails1(),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: const Color.fromARGB(255, 65, 21, 141),
                                  width: 3,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    //crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Container(
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Image.asset(
                                            widget.flightListRT[index]['image'],
                                            fit: BoxFit.cover,
                                            height: 40,
                                            width: 40,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        widget.flightListRT[index]
                                            ['flightName'],
                                        style: GoogleFonts.quicksand(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      const Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          widget.flightListRT[index]['price'],
                                          style: GoogleFonts.quicksand(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          widget.flightListRT[index]
                                              ['departTime'],
                                          style: GoogleFonts.quicksand(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          widget.flightListRT[index]['time'],
                                          style: GoogleFonts.quicksand(
                                            fontSize: 15,
                                            //fontWeight: FontWeight.w900
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Text(
                                          widget.flightListRT[index]
                                              ['returnTime'],
                                          style: GoogleFonts.quicksand(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8,
                                      right: 8,
                                      bottom: 8,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            widget.flightListRT[index]
                                                ['departFrom'],
                                            style: GoogleFonts.quicksand(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        const Icon(
                                          Icons.arrow_forward,
                                          size: 40,
                                          color: Colors.grey,
                                        ),
                                        // Text(
                                        //   widget.flightListRT[index]['stop'],
                                        //   style: GoogleFonts.quicksand(
                                        //     fontSize: 15,
                                        //     fontWeight: FontWeight.w600,
                                        //     color: Colors.grey,
                                        //   ),
                                        // ),
                                        const Spacer(),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            widget.flightListRT[index]
                                                ['goingTo'],
                                            style: GoogleFonts.quicksand(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // const Row(
                                  //   children: [
                                  //     Column(

                                  //       children: [
                                  //         Icon(Icons.arrow_forward,
                                  //         size: 40,
                                  //         ),
                                  //         Icon(Icons.arrow_back,
                                  //         size: 40,
                                  //         )

                                  //       ],
                                  //     )
                                  //   ],
                                  // ),
                                  Column(
                                    children: [
                                      Row(
                                        //crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Container(
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Image.asset(
                                                widget.flightListRT[index]
                                                    ['image1'],
                                                fit: BoxFit.cover,
                                                height: 40,
                                                width: 40,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            widget.flightListRT[index]
                                                ['flightName1'],
                                            style: GoogleFonts.quicksand(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          const Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              widget.flightListRT[index]['price1'],
                                              style: GoogleFonts.quicksand(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              widget.flightListRT[index]
                                                  ['departTime1'],
                                              style: GoogleFonts.quicksand(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              widget.flightListRT[index]
                                                  ['time1'],
                                              style: GoogleFonts.quicksand(
                                                fontSize: 15,
                                                //fontWeight: FontWeight.w900
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Text(
                                              widget.flightListRT[index]
                                                  ['returnTime1'],
                                              style: GoogleFonts.quicksand(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 8,
                                          right: 8,
                                          bottom: 8,
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                widget.flightListRT[index]
                                                    ['departFrom1'],
                                                style: GoogleFonts.quicksand(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            const Spacer(),
                                            const Icon(
                                              Icons.arrow_back,
                                              size: 40,
                                              color: Colors.grey,
                                            ),
                                            // Text(
                                            //   widget.flightListRT[index]
                                            //       ['stop1'],
                                            //   style: GoogleFonts.quicksand(
                                            //     fontSize: 15,
                                            //     fontWeight: FontWeight.w600,
                                            //     color: Colors.grey,
                                            //   ),
                                            // ),
                                            const Spacer(),
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                widget.flightListRT[index]
                                                    ['goingTo1'],
                                                style: GoogleFonts.quicksand(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
            ],
          ),
        ),
      ),
    );
  }
}
