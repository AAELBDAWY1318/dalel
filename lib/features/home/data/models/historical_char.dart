import 'package:dalel/core/utils/app_strings.dart';

class HistoricalCharacters {
  final String name;
  final String about;
  final String image;
  final List wars;
  final String id;

  HistoricalCharacters(
      {required this.name,
      required this.about,
      required this.image,
      required this.wars,
      required this.id});

  factory HistoricalCharacters.fromJson(Map<String, dynamic> json) {
    return HistoricalCharacters(
      name: json[FirebaseKeys.name],
      about: json[FirebaseKeys.about],
      image: json[FirebaseKeys.image],
      wars: json[FirebaseKeys.wars],
      id: json["id"],
    );
  }

  @override
  String toString() {
    return 'HistoricalPeriod{title: $name, about: $about, image: $image, wars: $wars, id: $id}';
  }
}
