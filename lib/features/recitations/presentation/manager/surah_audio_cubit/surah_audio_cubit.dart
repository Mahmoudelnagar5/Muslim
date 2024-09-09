import 'package:audioplayers/audioplayers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/features/recitations/data/repos/recitations_repo.dart';

import '../../../data/models/surah_audio/surah_audio.dart';

part 'surah_audio_state.dart';

class SurahAudioCubit extends Cubit<SurahAudioState> {
  SurahAudioCubit(this.recitationsRep) : super(SurahAudioInitial());
  RecitationsRepo recitationsRep;
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String? audioUrl;
  Future<void> fetchSurahAudio(
      {required String reciterId, required String chapterId}) async {
    emit(SurahAudioLoading());
    final result = await recitationsRep.fetchSurahAudio(
        reciterId: reciterId, chapterId: chapterId);
    result.fold((failure) {
      emit(SurahAudioError(failure.errMessage));
    }, (surahAudios) {
      emit(SurahAudioLoaded(surahAudios));
    });
  }

  Future<void> playAudio(String audioUrl) async {
    if (!isPlaying) {
      await audioPlayer.setSourceUrl(audioUrl);
      await audioPlayer.resume();
      isPlaying = true;
    }
  }

  Future<void> pauseAudio() async {
    await audioPlayer.pause();
    isPlaying = false;
  }

  Future<void> stopAudio() async {
    await audioPlayer.stop();
    isPlaying = false;
  }

  Future<void> resetAudio() async {
    await audioPlayer.stop();
    isPlaying = false;
  }
}
