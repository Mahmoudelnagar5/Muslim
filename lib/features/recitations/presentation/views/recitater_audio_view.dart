import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/features/recitations/data/models/recitation/recitation.dart';
import 'package:islami_app/features/recitations/presentation/views/widgets/control_audio.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../../../quran/data/models/quran/quran.dart';
import '../manager/surah_audio_cubit/surah_audio_cubit.dart';

class RecitaterAudioView extends StatefulWidget {
  const RecitaterAudioView(
      {super.key,
      required this.recitation,
      required this.surah,
      required this.surahList});
  final Recitation recitation;
  final Quran surah;
  final List<Quran> surahList;

  @override
  State<RecitaterAudioView> createState() => _RecitaterAudioViewState();
}

class _RecitaterAudioViewState extends State<RecitaterAudioView> {
  final AudioPlayer audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool isPlaying = false;
  bool isAudioLoaded = false;
  String? audioUrl;
  int currentSurahIndex = 0; // To track the current surah
  List<Quran> surahs = [];

  @override
  void initState() {
    super.initState();
    // Initialize with the current surah index
    currentSurahIndex = widget.surah.number! - 1;

    surahs = widget.surahList;

    // Fetch Surah Audio using the Bloc
    fetchSurahAudio();

    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      if (mounted) {
        setState(() {
          isPlaying = state == PlayerState.playing;
        });
      }
    });

    audioPlayer.onDurationChanged.listen((Duration newDuration) {
      if (mounted) {
        setState(() {
          duration = newDuration;
        });
      }
    });

    audioPlayer.onPositionChanged.listen((Duration newPosition) {
      if (mounted) {
        setState(() {
          position = newPosition;
        });
      }
    });
  }

  void fetchSurahAudio() {
    final surah =
        surahs[currentSurahIndex]; // Get surah by index from surahList
    BlocProvider.of<SurahAudioCubit>(context).fetchSurahAudio(
      reciterId: widget.recitation.id.toString(),
      chapterId: surah.number.toString(),
    );
  }

  void handlePreviousSurah() {
    setState(() {
      // Wrap around if index is less than 0
      currentSurahIndex =
          (currentSurahIndex - 1 + surahs.length) % surahs.length;
      isAudioLoaded = false;
      fetchSurahAudio();
    });
  }

  void handleNextSurah() {
    setState(() {
      // Wrap around if index exceeds list length
      currentSurahIndex = (currentSurahIndex + 1) % surahs.length;
      isAudioLoaded = false;
      fetchSurahAudio();
    });
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white),
        title: Text(
          'القاريء ${widget.recitation.translatedName ?? widget.recitation.reciterName ?? ''}',
          style: GoogleFonts.amiri(
            color: Colors.white,
            fontSize: 27,
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: AppColors.background,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: BlocBuilder<SurahAudioCubit, SurahAudioState>(
          builder: (context, state) {
            if (state is SurahAudioLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SurahAudioLoaded) {
              audioUrl = state.surahAudio.audioUrl;
              if (audioUrl != null && !isAudioLoaded) {
                audioPlayer.setSourceUrl(audioUrl!);

                isAudioLoaded = true;
              }
              return buildUiWidget();
            } else if (state is SurahAudioError) {
              return CustomErrorWidget(error: state.errMessage);
            } else {
              return const Center(
                child: Text("No audio available"),
              );
            }
          },
        ),
      ),
    );
  }

  Center buildUiWidget() {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.red,
            radius: 150,
            backgroundImage: AssetImage(widget.recitation.image!),
          ),
          const SizedBox(height: 40),
          Text(
            surahs[currentSurahIndex].name!,
            style: GoogleFonts.amiri(
              fontSize: 35,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Slider(
            activeColor: Colors.blue,
            inactiveColor: Colors.grey,
            min: 0.0,
            max: duration.inSeconds.toDouble(),
            value: position.inSeconds.toDouble(),
            onChanged: (value) async {
              final newPosition = Duration(seconds: value.toInt());
              await audioPlayer.seek(newPosition);
              setState(() {
                position = newPosition;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatTime(position),
                  style: GoogleFonts.amiri(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  formatTime(duration),
                  style: GoogleFonts.amiri(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Controls(
            audioPlayer: audioPlayer,
            onPrevious: handlePreviousSurah,
            onNext: handleNextSurah,
          ),
        ],
      ),
    );
  }
}
