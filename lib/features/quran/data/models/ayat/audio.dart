import 'package:equatable/equatable.dart';

class Audio extends Equatable {
  final String? first;
  final String? second;
  final String? third;
  final String? fourth;
  final String? fifth;

  const Audio({this.first, this.second, this.third, this.fourth, this.fifth});
  factory Audio.fromJson(Map<String, dynamic> json) => Audio(
        first: json['01'] as String?,
        second: json['02'] as String?,
        third: json['03'] as String?,
        fourth: json['04'] as String?,
        fifth: json['05'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '01': 01,
        '02': 02,
        '03': 03,
        '04': 04,
        '05': 05,
      };

  @override
  List<Object?> get props => [01, 02, 03, 04, 05];
}
