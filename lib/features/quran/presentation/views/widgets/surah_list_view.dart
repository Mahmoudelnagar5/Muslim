import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/features/quran/data/models/quran/quran.dart';
import 'package:islami_app/features/quran/presentation/views/widgets/surah_item.dart';
import 'package:islami_app/features/recitations/data/models/recitation/recitation.dart';

import '../../../../../core/widgets/custom_error_widget.dart';

class SurahListView extends StatelessWidget {
  const SurahListView({
    super.key,
    this.isSelected = false,
    this.recitation,
  });
  final bool isSelected;
  final Recitation? recitation;
  Future<List<Quran>> _getHadithList() async {
    String data = await rootBundle.loadString("assets/data/surahs.json");
    List<dynamic> list = await json.decode(data);
    return list.map((e) => Quran.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Quran>>(
        future: _getHadithList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return CustomErrorWidget(error: snapshot.error.toString());
          } else if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                if (isSelected) {
                  return SurahItem(
                    surahs: snapshot.data!,
                    recitation: recitation,
                    isSelected: true,
                    surah: snapshot.data![index],
                  );
                } else {
                  return SurahItem(
                    surahs: const [],
                    recitation: null,
                    surah: snapshot.data![index],
                  );
                }
              },
              separatorBuilder: (context, index) =>
                  Divider(color: const Color(0xFF7B80AD).withOpacity(.35)),
              itemCount: 114,
            );
          }
        });
  }
}
