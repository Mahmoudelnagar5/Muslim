import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/features/hadith/presentation/views/hadith_view.dart';
import 'package:islami_app/features/layout/presentation/views/widgets/custom_drawer.dart';
import '../../../../core/utils/colors.dart';
import '../../../quran/presentation/views/quran_view.dart';
import '../../../prayer/presentation/views/prayer_view.dart';
import '../../../azkar/presentation/views/azkar_view.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int currentIndex = 0;

  void changeBottomNavBar(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget getCurrentScreen() {
    return screens[currentIndex];
  }

  final List<Widget> screens = [
    const QuranView(),
    const AzkarView(),
    const PrayerView(),
    const HadithView(),
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          onPressed: _openDrawer,
          icon: SvgPicture.asset(
            'assets/images/menu-icon.svg',
            height: 33,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Muslim',
          style: TextStyle(
            fontSize: 35,
            color: Colors.white,
            fontFamily: 'Kamali',
          ),
        ),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(), // Use the CustomDrawer here
      body: getCurrentScreen(),
      bottomNavigationBar: CurvedNavigationBar(
        onTap: changeBottomNavBar,
        items: [
          SvgPicture.asset(
            'assets/images/quran-icon.svg',
            color: Colors.white,
            height: 35,
          ),
          const Icon(
            FlutterIslamicIcons.solidPrayingPerson,
            color: Colors.white,
            size: 30,
          ),
          const Icon(
            FlutterIslamicIcons.solidMosque,
            color: Colors.white,
            size: 30,
          ),
          const Icon(
            FlutterIslamicIcons.quran,
            color: Colors.white,
            size: 30,
          ),
        ],
        backgroundColor: AppColors.primary,
        buttonBackgroundColor: AppColors.background,
        animationCurve: Curves.easeInOut,
        color: AppColors.background,
        height: 60,
      ),
    );
  }
}
