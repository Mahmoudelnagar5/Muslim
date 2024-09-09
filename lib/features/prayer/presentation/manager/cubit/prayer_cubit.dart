import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/prayer/prayer.dart';
import '../../../data/repos/prayer_repo.dart';

part 'prayer_state.dart';

class PrayerCubit extends Cubit<PrayerState> {
  PrayerCubit(this.prayerRepo) : super(PrayerInitial());
  final PrayerRepo prayerRepo;

  Future<void> getPrayerTime() async {
    emit(PrayerLoading());
    final result = await prayerRepo.getPrayerTime();
    result.fold(
      (failure) => emit(PrayerError(failure.errMessage)),
      (data) => emit(PrayerLoaded(data)),
    );
  }
}
