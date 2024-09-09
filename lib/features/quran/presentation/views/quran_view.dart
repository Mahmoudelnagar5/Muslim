import 'package:flutter/material.dart';

import 'widgets/custom_quran_header.dart';
import 'widgets/surah_list_view.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: QuranViewBody(),
    );
  }
}

class QuranViewBody extends StatelessWidget {
  const QuranViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 5, left: 12, right: 12),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomQuranHeader(),
          ),
          SliverToBoxAdapter(
              child: SurahListView(
            recitation: null,
          )),
        ],
      ),
    );
  }
}
