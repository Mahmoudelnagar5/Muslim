import 'package:equatable/equatable.dart';

import '../../../data/models/ayat/ayat.dart';

sealed class SurahDetailsState extends Equatable {
  const SurahDetailsState();

  @override
  List<Object> get props => [];
}

class SurahDetailsInitial extends SurahDetailsState {}

class SurahDetailsLoading extends SurahDetailsState {}

class SurahDetailsLoaded extends SurahDetailsState {
  final Surah ayat;
  const SurahDetailsLoaded(this.ayat);
}

class SurahDetailsError extends SurahDetailsState {
  final String errMessage;
  const SurahDetailsError(this.errMessage);
}
