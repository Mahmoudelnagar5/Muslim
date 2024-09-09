import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart'; // Import the share package
import '../../../../../core/utils/colors.dart';
import '../../../data/models/ayat/ayat.dart';
import '../../../data/models/ayat/ayat_list.dart';

class AyaItem extends StatefulWidget {
  const AyaItem({super.key, required this.ayat, required this.data});
  final Surah ayat;
  final AyatList data;

  @override
  State<AyaItem> createState() => _AyaItemState();
}

class _AyaItemState extends State<AyaItem> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();

    // Listen for when the audio completes playing
    _audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false; // Reset to play icon when audio finishes
      });
    });
  }

  void _handleAudioPlayPause() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(UrlSource('${widget.data.audio!.fifth}'));
    }

    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void _handleShare() async {
    final String ayahText = widget.data.teksArab ?? '';
    final String surahName = widget.ayat.data?.nama ?? '';
    final String ayahNumber = widget.data.nomorAyat.toString();

    // Combine the data you want to share
    final String shareText =
        'Surah: $surahName\nAyah: $ayahNumber\n\n$ayahText';

    // Use the share plugin to share the text
    await Share.share(shareText);
  }

  @override
  void dispose() {
    _audioPlayer.stop(); // Ensures the audio stops when leaving the screen
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.gray,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Stack(
                  children: [
                    SvgPicture.asset('assets/images/nomor-surah.svg'),
                    SizedBox(
                      height: 36,
                      width: 36,
                      child: Center(
                        child: Text(
                          widget.data.nomorAyat.toString(),
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: _handleShare, // Handle share button press
                  icon: const Icon(
                    Icons.share_outlined,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                IconButton(
                  onPressed: _handleAudioPlayPause,
                  icon: Icon(
                    isPlaying
                        ? Icons.pause_outlined
                        : Icons.play_arrow_outlined,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                // IconButton(
                //   onPressed: () {},
                //   icon: const Icon(
                //     Icons.bookmark_outline,
                //     color: Colors.white,
                //   ),
                // ),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            widget.data.teksArab!,
            style: GoogleFonts.amiri(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            textAlign: TextAlign.right,
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}


// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../../../../core/utils/colors.dart';
// import '../../../data/models/ayat/ayat.dart';
// import '../../../data/models/ayat/ayat_list.dart';

// class AyaItem extends StatefulWidget {
//   const AyaItem({super.key, required this.ayat, required this.data});
//   final Surah ayat;
//   final AyatList data;

//   @override
//   State<AyaItem> createState() => _AyaItemState();
// }

// class _AyaItemState extends State<AyaItem> {
//   final AudioPlayer _audioPlayer = AudioPlayer();
//   bool isPlaying = false;

//   @override
//   void initState() {
//     super.initState();

//     // Listen for when the audio completes playing
//     _audioPlayer.onPlayerComplete.listen((event) {
//       setState(() {
//         isPlaying = false; // Reset to play icon when audio finishes
//       });
//     });
//   }

//   void _handleAudioPlayPause() async {
//     if (isPlaying) {
//       await _audioPlayer.pause();
//     } else {
//       await _audioPlayer.play(UrlSource('${widget.data.audio!.fifth}'));
//     }

//     setState(() {
//       isPlaying = !isPlaying;
//     });
//   }

//   @override
//   void dispose() {
//     _audioPlayer.stop(); // Ensures the audio stops when leaving the screen
//     _audioPlayer.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//             decoration: BoxDecoration(
//               color: AppColors.gray,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Row(
//               children: [
//                 Stack(
//                   children: [
//                     SvgPicture.asset('assets/images/nomor-surah.svg'),
//                     SizedBox(
//                       height: 36,
//                       width: 36,
//                       child: Center(
//                         child: Text(
//                           widget.data.nomorAyat.toString(),
//                           style: GoogleFonts.poppins(
//                             fontWeight: FontWeight.w600,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const Spacer(),
//                 const Icon(
//                   Icons.share_outlined,
//                   color: Colors.white,
//                 ),
//                 const SizedBox(
//                   width: 16,
//                 ),
//                 IconButton(
//                   onPressed: _handleAudioPlayPause,
//                   icon: Icon(
//                     isPlaying
//                         ? Icons.pause_outlined
//                         : Icons.play_arrow_outlined,
//                     color: Colors.white,
//                     size: 32,
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 16,
//                 ),
//                 IconButton(
//                   onPressed: () {},
//                   icon: const Icon(
//                     Icons.bookmark_outline,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 24,
//           ),
//           Text(
//             widget.data.teksArab!,
//             style: GoogleFonts.amiri(
//               fontWeight: FontWeight.bold,
//               fontSize: 24,
//             ),
//             textAlign: TextAlign.right,
//           ),
//           const SizedBox(
//             height: 16,
//           ),
//         ],
//       ),
//     );
//   }
// }
