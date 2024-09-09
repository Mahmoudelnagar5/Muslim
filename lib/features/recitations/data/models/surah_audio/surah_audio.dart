import 'package:equatable/equatable.dart';

class SurahAudio extends Equatable {
  int? id;
  String? audioUrl;

  SurahAudio({
    this.id,
    this.audioUrl,
  });

  factory SurahAudio.fromJson(Map<String, dynamic> json) {
    return SurahAudio(
      id: json['audio_file']['id'],
      audioUrl: json['audio_file']['audio_url']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['audio_url'] = audioUrl;
    return data;
  }

  @override
  List<Object?> get props => [id, audioUrl];
}
