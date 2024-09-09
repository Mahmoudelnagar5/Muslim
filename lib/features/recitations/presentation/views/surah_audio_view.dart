import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/features/recitations/data/models/recitation/recitation.dart';

import '../../../../core/utils/colors.dart';
import '../../../quran/presentation/views/widgets/surah_list_view.dart';

class SurahAudioView extends StatelessWidget {
  const SurahAudioView({super.key, required this.recitation});
  final Recitation recitation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white),
        title: Text(
          'القاريء ${recitation.translatedName ?? recitation.reciterName ?? ''} ',
          style: GoogleFonts.amiri(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: AppColors.background,
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SurahAudioViewBody(
              recitation: recitation,
            ),
          ),
        ],
      ),
    );
  }
}

class SurahAudioViewBody extends StatelessWidget {
  const SurahAudioViewBody({super.key, required this.recitation});
  final Recitation recitation;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14),
      child: SurahListView(
        recitation: recitation,
        isSelected: true,
      ),
    );
  }
}
