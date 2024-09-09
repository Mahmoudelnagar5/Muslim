import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'core/utils/app_router.dart';
import 'features/layout/presentation/manager/theme_cubit/theme_cubit.dart';

void main() {
  initializeDateFormatting();
  runApp(
    BlocProvider(
      create: (context) => ThemeCubit(),
      child: const QuranApp(),
    ),
  );
}

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        return MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          title: 'Quran App',
          theme: theme,
        );
      },
    );
  }
}
