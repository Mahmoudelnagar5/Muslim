import 'package:equatable/equatable.dart';

class Params extends Equatable {
  final double? fajr;
  final String? isha;

  const Params({this.fajr, this.isha});

  factory Params.fromJson(Map<String, dynamic> json) => Params(
        fajr: (json['Fajr'] as num?)?.toDouble(),
        isha: json['Isha'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'Fajr': fajr,
        'Isha': isha,
      };

  @override
  List<Object?> get props => [fajr, isha];
}
