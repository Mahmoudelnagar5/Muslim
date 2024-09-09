import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/core/utils/assets.dart';
import 'package:islami_app/core/utils/colors.dart';
import '../../data/models/names_model.dart';

class Names extends StatelessWidget {
  const Names({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        iconTheme: Theme.of(context).primaryIconTheme,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              AppAssets.allah,
              color: Colors.white,
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: AppColors.background,
        title: const Text(
          'أسماء الله الحسنى',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 5),
              child: Container(
                height: 65,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Text(
                  'الله',
                  style: GoogleFonts.amiri(
                    fontSize: 40,
                    color: AppColors.background,
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisExtent: 70,
                mainAxisSpacing: 6,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  NamesModel names = nameList[index];
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      // color: AppColors.background,
                    ),
                    child: Text(
                      names.text,
                      style: GoogleFonts.amiri(
                        fontSize: 24,
                        color: AppColors.background,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
                childCount: nameList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
