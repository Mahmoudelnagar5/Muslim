import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/core/utils/colors.dart';

class Sabhuh extends StatefulWidget {
  const Sabhuh({super.key});

  @override
  State<Sabhuh> createState() => _SabhuhState();
}

class _SabhuhState extends State<Sabhuh> {
  double angle = 0.0;
  int currentIndex = 0;
  int counter = 0;
  List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله اكبر",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        iconTheme: Theme.of(context).primaryIconTheme,
        backgroundColor: AppColors.background,
        title: Text(
          'المسبحة الاكترونية',
          style: GoogleFonts.amiri(
            color: Colors.white,
            fontSize: 27,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1, // adjusted value
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              // color: Colors.red,
              child: Text(
                "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "janna",
                  fontSize: MediaQuery.of(context).size.width * 0.08,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.14, // adjusted value
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Stack(
                children: [
                  Positioned(
                    left: MediaQuery.of(context).size.width *
                        0.475, // adjusted value
                    child: Image.asset(
                      "assets/images/sebah2.png",
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height *
                        0.09, // adjusted value
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.red,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            onClick();
                          });
                        },
                        child: Transform.rotate(
                          angle: angle,
                          child: Image.asset(
                            "assets/images/sebah1.png",
                            height: MediaQuery.of(context).size.height * 0.4,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height *
                        0.2, // adjusted value
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.red,
                      child: Text(
                        azkar[currentIndex],
                        style: GoogleFonts.amiri(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.12,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height *
                        0.13, // adjusted value
                    child: Container(
                      alignment: Alignment.center,
                      // color: Colors.red,
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        counter.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.09,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onClick() {
    setState(() {
      counter++;
      angle -= .5;
      if (counter == 33) {
        currentIndex++;
        counter = 0;
      }
      if (currentIndex > azkar.length - 1) {
        currentIndex = 0;
      }
    });
  }
}
