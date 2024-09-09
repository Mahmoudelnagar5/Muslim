import 'package:equatable/equatable.dart';

import 'audio.dart';

class AyatList extends Equatable {
  final int? nomorAyat;
  final String? teksArab;
  final String? teksLatin;
  final String? teksIndonesia;
  final Audio? audio;

  const AyatList({
    this.nomorAyat,
    this.teksArab,
    this.teksLatin,
    this.teksIndonesia,
    this.audio,
  });

  factory AyatList.fromJson(Map<String, dynamic> json) => AyatList(
        nomorAyat: json['nomorAyat'] as int?,
        teksArab: json['teksArab'] as String?,
        teksLatin: json['teksLatin'] as String?,
        teksIndonesia: json['teksIndonesia'] as String?,
        audio: json['audio'] == null
            ? null
            : Audio.fromJson(json['audio'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'nomorAyat': nomorAyat,
        'teksArab': teksArab,
        'teksLatin': teksLatin,
        'teksIndonesia': teksIndonesia,
        'audio': audio?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      nomorAyat,
      teksArab,
      teksLatin,
      teksIndonesia,
      audio,
    ];
  }
}
