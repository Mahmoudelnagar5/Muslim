import 'package:equatable/equatable.dart';

class TranslatedName extends Equatable {
  final String? name;
  final String? languageName;

  const TranslatedName({this.name, this.languageName});

  factory TranslatedName.fromJson(Map<String, dynamic> json) {
    return TranslatedName(
      name: json['name'] as String?,
      languageName: json['language_name'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'language_name': languageName,
      };

  @override
  List<Object?> get props => [name, languageName];
}
