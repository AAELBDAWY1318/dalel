import 'package:dalel/core/utils/app_strings.dart';

class SouvenirModel {
  final String id;
  final String title;
  final String image;
  final String price;

  SouvenirModel(
      {required this.id,
      required this.title,
      required this.image,
      required this.price});
  factory SouvenirModel.fromJson(Map<String, dynamic> json) {
    return SouvenirModel(
        id: json["id"],
        title: json[FirebaseKeys.title],
        image: json[FirebaseKeys.image],
        price: json[FirebaseKeys.price]);
  }
  @override
  String toString() {
    return "SouvenirModel{id: $id, title: $title, image: $image, price: $price}";
  }
}
