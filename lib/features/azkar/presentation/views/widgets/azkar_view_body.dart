import 'package:flutter/material.dart';
import 'package:islami_app/features/azkar/presentation/views/widgets/azkar_list_view.dart';
import 'package:islami_app/features/azkar/presentation/views/widgets/custom_azkar_header.dart';

import '../../../data/models/azkar/azkar.dart';

class AzkarViewBody extends StatelessWidget {
  const AzkarViewBody({super.key, required this.azkar});

  final List<Azkar> azkar;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
            child: CustomAzkarHeader(),
          ),
        ),
        AzkarListView(
          azkar: azkar,
        ),
      ],
    );
  }
}
