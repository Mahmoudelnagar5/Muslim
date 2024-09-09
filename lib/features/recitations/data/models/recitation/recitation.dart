class Recitation {
  int? id;
  String? reciterName;
  String? style;
  String? translatedName;
  String? audioUrl; // Add a field for storing the audio URL
  String? image;
  Recitation({
    this.id,
    this.reciterName,
    this.style,
    this.translatedName,
    this.audioUrl, // Include audioUrl in the constructor
    this.image,
  });

  factory Recitation.fromJson(Map<String, dynamic> json) {
    return Recitation(
      audioUrl: json['audio_url']?.toString(),
      id: json['id'],
      reciterName: json['reciter_name'],
      style: json['style'],
      translatedName: json['translated_name'] != null
          ? json['translated_name']['name']
          : null,
    );
  }

  static const Map<String, String> styleTranslations = {
    'Murattal': 'مرتل',
    'Muallim': 'موليم',
    'Mujawwad': 'مجود',
    // Add more translations as needed
  };
}

// static Future<List<Recitation>> getRecitations() async {
//   try {
//     final response = await http.get(Uri.parse(_apiURL));
//     if (response.statusCode == 200) {
//       final jsonData = json.decode(response.body);
//       final List<dynamic> recitationsJson = jsonData['recitations'];
//       return recitationsJson
//           .map((item) => RecitationsModel.fromJson(item))
//           .toList();
//     } else {
//       // Handle non-200 status codes
//       throw Exception('Failed to load recitations: ${response.statusCode}');
//     }
//   } on SocketException catch (e) {
//     // Handle SocketException
//     throw Exception('Failed to connect to the server: $e');
//   } catch (e) {
//     // Handle other exceptions
//     throw Exception('Failed to load recitations: $e');
//   }
// }
