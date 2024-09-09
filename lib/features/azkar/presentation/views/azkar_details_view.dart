import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/colors.dart';
import '../../../../core/utils/audio_services.dart';
import '../../data/models/azkar/azkar.dart';

class AzkarDetailsView extends StatefulWidget {
  const AzkarDetailsView({super.key, required this.azkar});
  final Azkar azkar;

  @override
  _AzkarDetailsViewState createState() => _AzkarDetailsViewState();
}

class _AzkarDetailsViewState extends State<AzkarDetailsView> {
  final AudioServices audioServices = AudioServices();

  @override
  void dispose() {
    // Stop the audio when the screen is disposed
    audioServices.stop(); // Ensure to stop and clean up
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        iconTheme: Theme.of(context).primaryIconTheme,
        title: Text(
          widget.azkar.category!,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
              ),
        ),
        backgroundColor: const Color.fromARGB(255, 81, 13, 110),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ZekerListView(
              azkar: widget.azkar,
              audioServices:
                  audioServices, // Pass the audio service to manage audio
            ),
          ),
        ],
      ),
    );
  }
}

class ZekerItem extends StatelessWidget {
  const ZekerItem({
    super.key,
    required this.zeker,
    required this.audioUrl,
    required this.audioServices, // Receive AudioServices as a parameter
  });

  final String zeker;
  final String audioUrl;
  final AudioServices audioServices; // Receive AudioServices instance

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 81, 13, 110),
      shadowColor: const Color.fromARGB(255, 81, 13, 110),
      elevation: 5,
      child: ListTile(
        title: Text(
          zeker,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
          textDirection: TextDirection.rtl,
        ),
        leading: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () async {
            await audioServices.play(audioUrl);
          },
          icon: const Icon(
            Icons.play_arrow,
            color: Colors.white,
            size: 26,
          ),
        ),
      ),
    );
  }
}

class ZekerListView extends StatelessWidget {
  const ZekerListView({
    super.key,
    required this.azkar,
    required this.audioServices, // Receive AudioServices as a parameter
  });

  final Azkar azkar;
  final AudioServices audioServices; // Receive AudioServices instance

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: azkar.array!.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: ZekerItem(
            zeker: azkar.array![index].text!,
            audioUrl: 'data${azkar.array![index].audio!}',
            audioServices:
                audioServices, // Pass the audioServices instance to each item
          ),
        );
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:islami_app/core/utils/colors.dart';

// import '../../../../core/utils/audio_services.dart';
// import '../../data/models/azkar/azkar.dart';

// class AzkarDetailsView extends StatelessWidget {
//   const AzkarDetailsView({super.key, required this.azkar});
//   final Azkar azkar;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       appBar: AppBar(
//         iconTheme: Theme.of(context).primaryIconTheme,
//         title: Text(
//           azkar.category!,
//           style: Theme.of(context).textTheme.headlineMedium?.copyWith(
//                 color: Colors.white,
//               ),
//         ),
//         backgroundColor: const Color.fromARGB(255, 81, 13, 110),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ZekerListView(
//               azkar: azkar,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ZekerItem extends StatelessWidget {
//   const ZekerItem({super.key, required this.zeker, required this.audioUrl});

//   final String zeker;
//   final String audioUrl; // Pass the audio URL

//   @override
//   Widget build(BuildContext context) {
//     final audioServices = AudioServices();
//     return Card(
//       color: const Color.fromARGB(255, 81, 13, 110),
//       shadowColor: const Color.fromARGB(255, 81, 13, 110),
//       elevation: 5,
//       child: ListTile(
//         title: Text(
//           zeker,
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 18,
//             color: Colors.white,
//           ),
//           textDirection: TextDirection.rtl,
//         ),
//         leading: IconButton(
//           padding: EdgeInsets.zero,
//           onPressed: () async {
//             await audioServices.play(
//               audioUrl,
//             );
//           },
//           icon: const Icon(
//             Icons.play_arrow,
//             color: Colors.white,
//             size: 26,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ZekerListView extends StatelessWidget {
//   const ZekerListView({super.key, required this.azkar});
//   final Azkar azkar;

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       physics: const BouncingScrollPhysics(),
//       itemCount: azkar.array!.length,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 5.0),
//           child: ZekerItem(
//             zeker: azkar.array![index].text!,
//             audioUrl: 'data${azkar.array![index].audio!}',
//           ),
//         );
//       },
//       // separatorBuilder: (context, index) => const Divider(),
//     );
//   }
// }
