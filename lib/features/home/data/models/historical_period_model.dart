import 'package:dalel/core/utils/app_strings.dart';

class HistoricalPeriod {
  final String title;
  final String description;
  final String image;
  final List wars;
  final String id;

  HistoricalPeriod(
      {required this.title,
      required this.description,
      required this.id,
      required this.image,
      required this.wars});

  factory HistoricalPeriod.fromJson(Map<String, dynamic> json) {
    return HistoricalPeriod(
      title: json[FirebaseKeys.title],
      description: json[FirebaseKeys.description],
      image: json[FirebaseKeys.image],
      wars: json[FirebaseKeys.wars],
      id: json["id"],
    );
  }

  // Map<String , dynamic> toJson(){
  //   return {
  //     FirebaseKeys.title: title, 
  //     FirebaseKeys.description : description, 
  //     FirebaseKeys.image: image , 
  //     FirebaseKeys.wars: 
  //   };
  // }
  @override
  String toString() {
    return 'HistoricalPeriod{title: $title, description: $description, image: $image, wars: $wars, id: $id}';
  }
}
