import 'package:flutter/material.dart';
import 'package:islami_app/features/quran/data/models/ayat/ayat.dart';
import 'package:islami_app/features/quran/presentation/views/widgets/ayah_item.dart';

import '../../../data/models/ayat/ayat_list.dart';

class AyatListView extends StatelessWidget {
  const AyatListView({super.key, required this.ayat});
  final Surah ayat;
  @override
  Widget build(BuildContext context) {
    List<AyatList> data = ayat.data!.ayat!;
    return SliverList.builder(
      itemCount: ayat.data!.ayat!.length,
      itemBuilder: (context, index) {
        return AyaItem(ayat: ayat, data: data[index]);
      },
    );
  }
}
