import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Us",
          style: GoogleFonts.aBeeZee(
            fontSize: 30,
            fontWeight: FontWeight.bold,
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
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 65, 21, 141),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF662D8C), // #662D8C
                Color(0xFFED1E79), // #ED1E79
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Project Team :-",
                style: GoogleFonts.aBeeZee(
                  fontSize: 26,
                  color: Colors.white,
                 fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "- Pratik Roman",
                style: GoogleFonts.aBeeZee(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "- Amruta Jadhav",
                style: GoogleFonts.aBeeZee(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "- Akshaya Salunke",
                style: GoogleFonts.aBeeZee(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "- Suresh Pawar",
                style: GoogleFonts.aBeeZee(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                "A teacher does more than share knowledge; they inspire, motivate, and nurture the unique potential in each student. Great teachers know how to unlock the best in their students, guiding them toward a brighter future. We are truly fortunate to have teachers like our dedicated Shashi Sir and Akshay Sir & mentors, who not only teach but uplift and encourage us every step of the way and also thanks to the Mentors for guiding us. Being part of this family feels like a blessing.\nAlso Special thanks to Rahul Dada & Dhanashree Didi for guiding & helping us.",
                style: GoogleFonts.aBeeZee(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
