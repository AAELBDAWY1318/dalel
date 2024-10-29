import 'package:dalel/core/utils/app_strings.dart';

class WarSubModel {
  final String title;
  final String image;

  WarSubModel({required this.title, required this.image});

  factory WarSubModel.fromJson(Map json) {
    return WarSubModel(
        title: json[FirebaseKeys.title], image: json[FirebaseKeys.image]);
  }
}
