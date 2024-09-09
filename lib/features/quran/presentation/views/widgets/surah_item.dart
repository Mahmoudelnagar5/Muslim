import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/features/quran/data/models/quran/quran.dart';
import 'package:islami_app/features/recitations/data/models/recitation/recitation.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/colors.dart';

class SurahItem extends StatelessWidget {
  const SurahItem({
    super.key,
    required this.surah,
    this.isSelected = false,
    required this.recitation,
    required this.surahs,
  });
  final Quran surah;
  final bool isSelected;
  final Recitation? recitation;
  final List<Quran> surahs;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isSelected && recitation != null) {
          GoRouter.of(context).push(
            AppRouter.recitationsAudioView,
            extra: [recitation as Recitation, surah, surahs],
          );
        } else {
          GoRouter.of(context)
              .push(AppRouter.surahDetails, extra: surah.number);
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 14, top: 8),
        child: Row(
          children: [
            Stack(
              children: [
                SvgPicture.asset('assets/images/nomor-surah.svg'),
                SizedBox(
                  height: 36,
                  width: 36,
                  child: Center(
                    child: Text(
                      surah.number.toString(),
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    surah.englishName.toString(),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Text(
                        surah.revelationType.toString(),
                        style: GoogleFonts.poppins(
                          color: AppColors.text,
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: AppColors.text,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${surah.numberOfAyahs} Verses',
                        style: GoogleFonts.poppins(
                          color: AppColors.text,
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Text(
              surah.name.toString(),
              style: GoogleFonts.amiri(
                color: AppColors.primary,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
