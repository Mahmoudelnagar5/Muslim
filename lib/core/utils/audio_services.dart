import 'package:audioplayers/audioplayers.dart';

class AudioServices {
  static final AudioPlayer audioPlayer = AudioPlayer();

  // Play audio from a URL
  Future<void> play(String url) async {
    await audioPlayer.play(AssetSource(url));
  }

  // Pause the currently playing audio
  Future<void> pause() async {
    await audioPlayer.pause();
  }

  // Stop the audio
  Future<void> stop() async {
    await audioPlayer.stop();
  }

  Future<void> resume() async {
    await audioPlayer.resume();
  }

  // Optionally dispose the player when done
  Future<void> dispose() async {
    await audioPlayer.dispose();
  }
}
