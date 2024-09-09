import 'package:flutter/material.dart';
import 'package:islami_app/features/azkar/presentation/views/widgets/zeker_item.dart';

import '../../../data/models/azkar/azkar.dart';

class AzkarListView extends StatelessWidget {
  const AzkarListView({super.key, required this.azkar});

  final List<Azkar> azkar;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: azkar.length,
      itemBuilder: (context, index) => ZekerItem(
        azkar: azkar[index],
      ),
    );
  }
}
