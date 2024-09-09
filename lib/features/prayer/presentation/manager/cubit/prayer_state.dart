part of 'prayer_cubit.dart';

sealed class PrayerState extends Equatable {
  const PrayerState();

  @override
  List<Object> get props => [];
}

final class PrayerInitial extends PrayerState {}

final class PrayerLoading extends PrayerState {}

final class PrayerLoaded extends PrayerState {
  final Prayer prayerTimes;
  const PrayerLoaded(this.prayerTimes);
}

final class PrayerError extends PrayerState {
  final String errMessage;
  const PrayerError(this.errMessage);
}
