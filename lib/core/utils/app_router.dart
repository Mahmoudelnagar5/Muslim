import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islami_app/core/utils/api_services.dart';
import 'package:islami_app/features/layout/presentation/views/names.dart';
import 'package:islami_app/features/recitations/presentation/manager/surah_audio_cubit/surah_audio_cubit.dart';
import 'package:islami_app/features/recitations/presentation/views/recitater_audio_view.dart';
import 'package:islami_app/features/recitations/presentation/views/surah_audio_view.dart';
import 'package:islami_app/features/splash/presentation/views/splash_view.dart';
import '../../features/azkar/data/models/azkar/azkar.dart';
import '../../features/azkar/presentation/views/azkar_details_view.dart';
import '../../features/hadith/presentation/views/hadith_view.dart';
import '../../features/quran/data/models/quran/quran.dart';
import '../../features/quran/data/repos/home_repo_impl.dart';
import '../../features/quran/presentation/manager/surah_details_cubit/surah_details_cubit.dart';
import '../../features/quran/presentation/views/quran_view.dart';
import '../../features/quran/presentation/views/surah_details_view.dart';
import '../../features/layout/presentation/views/layout_view.dart';
import '../../features/prayer/data/repos/prayer_repo_impl.dart';
import '../../features/prayer/presentation/manager/cubit/prayer_cubit.dart';
import '../../features/recitations/data/models/recitation/recitation.dart';
import '../../features/recitations/data/repos/recitations_repo_impl.dart';
import '../../features/recitations/presentation/manager/recitation_cubit/recitation_cubit.dart';
import '../../features/recitations/presentation/views/recitations_view.dart';
import '../../features/sabhuh.dart/presentation/views/sabhuh_view.dart';

abstract class AppRouter {
  static const String initialRoute = '/';

  static const String homeView = '/home';

  static const String layoutView = '/layout';

  static const String surahDetails = '/surahDetails';

  static const String azkarDetails = '/azkarDetails';

  static const String prayerView = '/prayerView';

  static const String hadithView = '/hadithView';

  static const String surahAudioView = '/surahAudioView';

  static const String recitationsAudioView = '/recitationsAudioView';

  static const String recitationsView = '/recitationsView';

  static const String namesAllah = '/namesAllah';

  static const String sebah = '/sebah';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: initialRoute,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: layoutView,
        builder: (context, state) => BlocProvider(
          create: (context) => PrayerCubit(
            PrayerRepoImpl(
              ApiServices(
                Dio(),
              ),
            ),
          ),
          child: const LayoutView(),
        ),
      ),
      GoRoute(
        path: homeView,
        builder: (context, state) => const QuranView(),
      ),
      GoRoute(
        path: surahDetails,
        builder: (context, state) => BlocProvider(
          create: (context) => SurahDetailsCubit(
            HomeRepoImpl(
              ApiServices(
                Dio(),
              ),
            ),
          ),
          child: SurahDetailsView(
            id: state.extra.toString(),
          ),
        ),
      ),
      GoRoute(
        path: azkarDetails,
        builder: (context, state) => AzkarDetailsView(
          azkar: state.extra as Azkar, // error
        ),
      ),
      GoRoute(
        path: surahAudioView,
        builder: (context, state) => SurahAudioView(
          recitation: state.extra as Recitation,
        ),
      ),
      GoRoute(
        path: recitationsAudioView,
        builder: (context, state) {
          List<Object> list = state.extra as List<Object>;

          return BlocProvider(
            create: (context) => SurahAudioCubit(
              RecitationsRepoImpl(
                ApiServices(
                  Dio(),
                ),
              ),
            ),
            child: RecitaterAudioView(
              recitation: list[0] as Recitation,
              surah: list[1] as Quran,
              surahList: list[2] as List<Quran>,
            ),
          );
        },
      ),
      GoRoute(
        path: recitationsView,
        builder: (context, state) => BlocProvider(
          create: (context) => RecitationCubit(
            RecitationsRepoImpl(
              ApiServices(
                Dio(),
              ),
            ),
          ),
          child: const RecitationsView(),
        ),
      ),
      GoRoute(
        path: hadithView,
        builder: (context, state) => const HadithView(),
      ),
      GoRoute(
        path: namesAllah,
        builder: (context, state) => const Names(),
      ),
      GoRoute(
        path: sebah,
        builder: (context, state) => const Sabhuh(),
      ),
    ],
  );
}
