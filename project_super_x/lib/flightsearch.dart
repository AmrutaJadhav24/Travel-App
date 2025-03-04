import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_screen/flightdetails.dart';
import 'package:home_screen/payment_confirmed.dart';

class FlightSearch extends StatefulWidget {
  final List flightList;
  const FlightSearch({super.key, required this.flightList});

  @override
  State createState() => _FlightSearchState();
}

class _FlightSearchState extends State<FlightSearch> {
  IconData? returnArrow() {
    if (widget.flightList.isEmpty) {
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
                    widget.flightList.isNotEmpty
                        ? widget.flightList[0]['departFrom']
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
                    widget.flightList.isNotEmpty
                        ? widget.flightList[0]['goingTo']
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
              widget.flightList.isEmpty
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
                      itemCount: widget.flightList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        widget.flightList[index];
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                              type2 = widget.flightList[index]['flightName'];
                              type3 =
                                  "${widget.flightList[index]['departFrom']} Port- ${widget.flightList[index]['goingTo']} Port";
                              // type4 = dateController.text;
                              detailList.clear();
                              detailList.add(widget.flightList[index]);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const FlightDetails(),
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
                                            widget.flightList[index]['image'],
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
                                        widget.flightList[index]['flightName'],
                                        style: GoogleFonts.quicksand(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      const Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          widget.flightList[index]['price'],
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
                                          widget.flightList[index]
                                              ['departTime'],
                                          style: GoogleFonts.quicksand(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          widget.flightList[index]['time'],
                                          style: GoogleFonts.quicksand(
                                            fontSize: 15,
                                            //fontWeight: FontWeight.w900
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Text(
                                          widget.flightList[index]
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
                                            widget.flightList[index]
                                                ['departFrom'],
                                            style: GoogleFonts.quicksand(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          widget.flightList[index]['stop'],
                                          style: GoogleFonts.quicksand(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        const Spacer(),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            widget.flightList[index]['goingTo'],
                                            style: GoogleFonts.quicksand(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ],
                                    ),
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
