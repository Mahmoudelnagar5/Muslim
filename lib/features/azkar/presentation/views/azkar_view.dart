import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/features/azkar/data/models/azkar/azkar.dart';
import 'package:islami_app/features/azkar/presentation/views/widgets/azkar_view_body.dart';

import '../../../../core/widgets/custom_error_widget.dart';

class AzkarView extends StatelessWidget {
  const AzkarView({super.key});

  Future<List<Azkar>> _fetchAzkar() async {
    String data = await rootBundle.loadString("assets/data/adhkar.json");
    return List<Azkar>.from(json.decode(data).map((x) => Azkar.fromJson(x)));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Azkar>>(
      future: _fetchAzkar(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: AzkarViewBody(azkar: snapshot.data!),
          );
        } else if (snapshot.hasError) {
          return CustomErrorWidget(error: snapshot.error.toString());
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
