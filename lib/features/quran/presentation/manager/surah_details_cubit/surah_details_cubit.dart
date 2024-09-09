import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/features/quran/presentation/manager/surah_details_cubit/surah_details_state.dart';

import '../../../data/repos/home_repo.dart';

class SurahDetailsCubit extends Cubit<SurahDetailsState> {
  SurahDetailsCubit(this.homeRepo) : super(SurahDetailsInitial());
  final HomeRepo homeRepo;
  Future<void> fetchSurahDetails({required String id}) async {
    emit(SurahDetailsLoading());
    final result = await homeRepo.fetchSurahDetails(id: id);
    result.fold(
      (failure) => emit(SurahDetailsError(failure.errMessage)),
      (surah) => emit(SurahDetailsLoaded(surah)),
    );
  }
}
