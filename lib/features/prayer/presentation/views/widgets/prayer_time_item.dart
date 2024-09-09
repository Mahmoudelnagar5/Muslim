import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/colors.dart';

class PrayerTimeItem extends StatelessWidget {
  final String label;
  final String time;

  const PrayerTimeItem({
    super.key,
    required this.label,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.amiri(
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
          Text(
            time,
            style: GoogleFonts.amiri(
              color: AppColors.primary,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
