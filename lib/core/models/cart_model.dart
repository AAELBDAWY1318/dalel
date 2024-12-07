import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/home/data/models/souvenir_model.dart';

class CartModel {
  final String userId;
  final String image;
  final String title;
  final String price;

  CartModel(
      {required this.userId,
      required this.image,
      required this.title,
      required this.price});

  factory CartModel.fromJson(Map json) {
    return CartModel(
        userId: json[FirebaseKeys.userId],
        image: json[FirebaseKeys.image],
        title: json[FirebaseKeys.title],
        price: json[FirebaseKeys.price]);
  }

  factory CartModel.fromSouvenir(SouvenirModel souvenirModel, String id) {
    return CartModel(
        userId: id,
        image: souvenirModel.image,
        title: souvenirModel.title,
        price: souvenirModel.price);
  }

  @override
  String toString() {
    return "CartModel{userId: $userId,image: $image,title: $title,price: $price}";
  }
}
