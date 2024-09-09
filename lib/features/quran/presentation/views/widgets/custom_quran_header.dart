import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomQuranHeader extends StatelessWidget {
  const CustomQuranHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .3,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0, .6, 1],
              colors: [
                Color(0xFFDF98FA),
                Color(0xFFB070FD),
                Color(0xFF9055FF),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 0,
          child: Opacity(
            opacity: .2,
            child: SvgPicture.asset(
              'assets/images/quran.svg',
              height: MediaQuery.of(context).size.height * .28,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 87.0),
          child: Center(
            child: Text(
              'وَنُنـزلُ مِنَ الْقُرْآنِ مَا هُوَ شِفَاءٌ وَرَحْمَةٌ لِلْمُؤْمِنِينَ',
              style: GoogleFonts.amiri(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
