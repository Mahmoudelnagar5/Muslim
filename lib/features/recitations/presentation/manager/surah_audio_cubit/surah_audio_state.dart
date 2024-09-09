part of 'surah_audio_cubit.dart';

sealed class SurahAudioState extends Equatable {
  const SurahAudioState();

  @override
  List<Object> get props => [];
}

final class SurahAudioInitial extends SurahAudioState {}

class SurahAudioLoading extends SurahAudioState {}

class SurahAudioLoaded extends SurahAudioState {
  final SurahAudio surahAudio;
  const SurahAudioLoaded(this.surahAudio);
}

class SurahAudioError extends SurahAudioState {
  final String errMessage;
  const SurahAudioError(this.errMessage);
}
