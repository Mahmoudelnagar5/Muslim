import 'package:equatable/equatable.dart';

import 'data.dart';

class Surah extends Equatable {
  final int? code;
  final String? message;
  final Data? data;

  const Surah({this.code, this.message, this.data});

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        code: json['code'] as int?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as dynamic),
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
        'data': data?.toJson(),
      };

  @override
  List<Object?> get props => [code, message, data];
}
