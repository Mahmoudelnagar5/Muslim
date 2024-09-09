import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../manager/cubit/prayer_cubit.dart';
import 'widgets/custom_hijri_text.dart';
import 'widgets/prayer_view_body.dart';

class PrayerView extends StatefulWidget {
  const PrayerView({super.key});

  @override
  State<PrayerView> createState() => _PrayerViewState();
}

class _PrayerViewState extends State<PrayerView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PrayerCubit>(context).getPrayerTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PrayerViewBody(),
    );
  }
}

class CustomPrayerHeader extends StatelessWidget {
  const CustomPrayerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .24,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFB070FD),
                Color(0xFF9055FF),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: -100,
          right: 0,
          child: Opacity(
            opacity: .25,
            child: Image.asset(
              'assets/images/prayer.avif',
              height: MediaQuery.of(context).size.height * .56,
              // width: 250,
              // fit: BoxFit.contain,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'مواقيت الصلاة',
                style: GoogleFonts.amiri(
                  textStyle: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),

              // const Spacer(),
              Column(
                children: [
                  Text(
                    DateFormat.yMEd('ar').format(DateTime.now()),
                    style: GoogleFonts.amiri(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  hijriText(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
