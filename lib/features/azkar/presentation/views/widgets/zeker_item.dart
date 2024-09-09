import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/core/utils/app_router.dart';
import 'package:islami_app/features/azkar/data/models/azkar/azkar.dart';

class ZekerItem extends StatelessWidget {
  const ZekerItem({super.key, required this.azkar});
  final Azkar azkar;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.azkarDetails, extra: azkar);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          // height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromARGB(255, 81, 13, 110),
          ),
          child: Text(
            azkar.category!,
            style: GoogleFonts.amiri(
              fontWeight: FontWeight.w900,
              fontSize: 20,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
            textDirection: TextDirection.rtl,
          ),
        ),
      ),
    );
  }
}
