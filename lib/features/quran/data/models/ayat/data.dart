import 'package:equatable/equatable.dart';
import 'audio.dart';
import 'ayat_list.dart';

class Data extends Equatable {
  final int? nomor;
  final String? nama;
  final String? namaLatin;
  final int? jumlahAyat;
  final String? tempatTurun;
  final String? arti;
  final String? deskripsi;
  final Audio? audioFull;
  final List<AyatList>? ayat;
  const Data({
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
    this.tempatTurun,
    this.arti,
    this.deskripsi,
    this.audioFull,
    this.ayat,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        nomor: json['nomor'] as int?,
        nama: json['nama'] as String?,
        namaLatin: json['namaLatin'] as String?,
        jumlahAyat: json['jumlahAyat'] as int?,
        tempatTurun: json['tempatTurun'] as String?,
        arti: json['arti'] as String?,
        deskripsi: json['deskripsi'] as String?,
        audioFull: json['audioFull'] == null
            ? null
            : Audio.fromJson(json['audioFull'] as Map<String, dynamic>),
        ayat: json['ayat'] == null
            ? null
            : List<AyatList>.from(
                (json['ayat'] as List<dynamic>).map(
                  (e) => AyatList.fromJson(e as dynamic),
                ),
              ),
        // suratSelanjutnya: json['suratSelanjutnya'] == null
        //     ? null
        //     : SuratSelanjutnya.fromJson(
        //         json['suratSelanjutnya'] as Map<String, dynamic>),
        // suratSebelumnya: json['suratSebelumnya'] == null
        //     ? null
        //     : SuratSebelumnya.fromJson(
        //         json['suratSebelumnya'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'nomor': nomor,
        'nama': nama,
        'namaLatin': namaLatin,
        'jumlahAyat': jumlahAyat,
        'tempatTurun': tempatTurun,
        'arti': arti,
        'deskripsi': deskripsi,
        'audioFull': audioFull?.toJson(),
        'ayat': ayat?.map((e) => e.toJson()).toList(),
        // 'suratSelanjutnya': suratSelanjutnya?.toJson(),
        // 'suratSebelumnya': suratSebelumnya?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      nomor,
      nama,
      namaLatin,
      jumlahAyat,
      tempatTurun,
      arti,
      deskripsi,
      audioFull,
      ayat,
      // suratSelanjutnya,
      // suratSebelumnya,
    ];
  }
}
