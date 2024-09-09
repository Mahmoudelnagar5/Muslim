import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/features/prayer/presentation/views/widgets/prayer_time_item.dart';

import '../../../../../core/widgets/custom_error_widget.dart';
import '../../manager/cubit/prayer_cubit.dart';
import '../prayer_view.dart';

class PrayerViewBody extends StatelessWidget {
  const PrayerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 7),
            child: CustomPrayerHeader(),
          ),
          BlocBuilder<PrayerCubit, PrayerState>(
            builder: (context, state) {
              if (state is PrayerError) {
                return CustomErrorWidget(error: state.errMessage);
              } else if (state is PrayerLoaded) {
                final prayerTime = state.prayerTimes;
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    height: size.height * 0.7,
                    width: size.width * 1,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PrayerTimeItem(
                            label: 'صلاة الفجر',
                            time: prayerTime.data!.timings!.fajr!),
                        const Divider(),
                        PrayerTimeItem(
                          label: 'الشروق ',
                          time: prayerTime.data!.timings!.sunrise!,
                        ),
                        const Divider(),
                        PrayerTimeItem(
                          label: 'صلاة الضهر',
                          time: prayerTime.data!.timings!.dhuhr!,
                        ),
                        const Divider(),
                        PrayerTimeItem(
                          label: 'صلاة العصر',
                          time: prayerTime.data!.timings!.asr!,
                        ),
                        const Divider(),
                        PrayerTimeItem(
                          label: 'صلاة المغرب',
                          time: prayerTime.data!.timings!.maghrib!,
                        ),
                        const Divider(),
                        PrayerTimeItem(
                          label: 'صلاة العشاء',
                          time: prayerTime.data!.timings!.isha!,
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
