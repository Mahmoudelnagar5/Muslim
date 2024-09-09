import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/features/quran/presentation/views/widgets/ayat_list_view.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../manager/surah_details_cubit/surah_details_cubit.dart';
import '../manager/surah_details_cubit/surah_details_state.dart';
import 'widgets/surah_details.dart';

class SurahDetailsView extends StatefulWidget {
  const SurahDetailsView({super.key, required this.id});
  final String id;

  @override
  State<SurahDetailsView> createState() => _SurahDetailsViewState();
}

class _SurahDetailsViewState extends State<SurahDetailsView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SurahDetailsCubit>(context)
        .fetchSurahDetails(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurahDetailsCubit, SurahDetailsState>(
      builder: (context, state) {
        if (state is SurahDetailsLoaded) {
          final ayat = state.ayat;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.background,
              iconTheme: Theme.of(context).primaryIconTheme,
              title: Text(
                ayat.data?.nama.toString() ?? '',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Colors.white,
                    ),
              ),
              centerTitle: true,
            ),
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SurahDeatails(
                    ayat: ayat,
                  ),
                ),
                AyatListView(
                  ayat: ayat,
                ),
              ],
            ),
          );
        } else if (state is SurahDetailsError) {
          return CustomErrorWidget(error: state.errMessage);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
