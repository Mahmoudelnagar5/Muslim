import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../data/models/recitation/recitation.dart';

class RecitationsItem extends StatelessWidget {
  const RecitationsItem({super.key, required this.recitation});
  final Recitation recitation;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.surahAudioView, extra: recitation);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          color: Color.fromARGB(255, 74, 16, 141),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Recitation.styleTranslations[recitation.style ?? 'مرتل'] ??
                    recitation.style ??
                    'مرتل',
                style: GoogleFonts.amiri(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                recitation.translatedName ?? recitation.reciterName ?? '',
                style: GoogleFonts.amiri(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
