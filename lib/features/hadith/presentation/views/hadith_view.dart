import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/core/utils/colors.dart';
import 'package:islami_app/core/widgets/custom_error_widget.dart';
import 'package:islami_app/features/hadith/data/models/hadith/hadith.dart';

class HadithView extends StatelessWidget {
  const HadithView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: const CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: CustomHadithHeader(),
          ),
          HadithViewBody(),
        ],
      ),
    );
  }
}

class CustomHadithHeader extends StatelessWidget {
  const CustomHadithHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .27,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 0.6, 1.0],
                colors: [
                  Color(0xFFDF98FA),
                  Color(0xFFB070FD),
                  Color(0xFF9055FF),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 18,
            right: 0,
            child: Opacity(
              opacity: .2,
              child: SvgPicture.asset(
                'assets/images/quran.svg',
                height: MediaQuery.of(context).size.height * .27,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 80.0),
            child: Center(
              child: Text(
                'الأحاديث الأربعين النووية',
                style: GoogleFonts.amiri(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 32,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HadithViewBody extends StatelessWidget {
  const HadithViewBody({super.key});

  Future<List<Hadith>> _getHadithList() async {
    String data = await rootBundle.loadString("assets/data/list_ahdis.json");
    List<dynamic> list = json.decode(data);
    return list.map((e) => Hadith.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Hadith>>(
      future: _getHadithList(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return SliverToBoxAdapter(
              child: CustomErrorWidget(error: snapshot.error.toString()));
        } else if (!snapshot.hasData) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          List<Hadith> list = snapshot.data!;
          if (list.isEmpty) {
            return const Center(
              child: Text("لا يوجد احاديث"),
            );
          }
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return HadithItem(hadith: list[index]);
              },
              childCount: list.length,
            ),
          );
        }
      },
    );
  }
}

class HadithItem extends StatelessWidget {
  const HadithItem({super.key, required this.hadith});
  final Hadith hadith;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Text(
              '${hadith.number}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${hadith.arab}',
            style: GoogleFonts.amiri(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
    );
  }
}
