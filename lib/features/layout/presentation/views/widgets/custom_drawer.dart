import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assets.dart';
import '../../manager/theme_cubit/theme_cubit.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        bool isDarkMode = theme.brightness == Brightness.dark;
        return Drawer(
          child: Column(
            children: [
              Stack(
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFDF98FA),
                          Color(0xFFB070FD),
                          Color(0xFF9055FF),
                        ],
                      ),
                    ),
                    child: null,
                  ),
                  Positioned(
                    bottom: 10,
                    right: 0,
                    child: SvgPicture.asset(
                      'assets/images/quran.svg',
                      width: 310,
                    ),
                  ),
                ],
              ),
              ListTile(
                leading: const Icon(
                  Icons.home,
                  size: 32,
                ),
                title: Text(
                  'الصفحة الرئيسية',
                  textDirection: TextDirection.rtl,
                  style: GoogleFonts.amiri(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(
                  FlutterIslamicIcons.prayingPerson,
                  size: 33,
                ),
                title: Text(
                  'القراء',
                  textDirection: TextDirection.rtl,
                  style: GoogleFonts.amiri(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                onTap: () {
                  GoRouter.of(context).push(AppRouter.recitationsView);
                },
              ),
              const SizedBox(height: 15),
              ListTile(
                leading: SvgPicture.asset(
                  'assets/images/sebahh.svg',
                  color: isDarkMode ? Colors.white : Colors.black,
                  height: 40,
                ),
                title: Text(
                  'المسبحة الاكترونية',
                  textDirection: TextDirection.rtl,
                  style: GoogleFonts.amiri(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                onTap: () {
                  GoRouter.of(context).push(AppRouter.sebah);
                },
              ),
              const SizedBox(height: 15),
              ListTile(
                leading: Image.asset(
                  AppAssets.allah,
                  color: isDarkMode ? Colors.white : Colors.black,
                  height: 40,
                ),
                title: Text(
                  'أسماء الله الحسنى',
                  textDirection: TextDirection.rtl,
                  style: GoogleFonts.amiri(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                onTap: () {
                  GoRouter.of(context).push(AppRouter.namesAllah);
                },
              ),
              const SizedBox(height: 15),
              ListTile(
                leading: Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    context.read<ThemeCubit>().toggleTheme(value);
                  },
                ),
                title: Text(
                  'الوضع الليلي',
                  textDirection: TextDirection.rtl,
                  style: GoogleFonts.amiri(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
