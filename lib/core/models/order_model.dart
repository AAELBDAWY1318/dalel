import 'package:dalel/core/utils/app_strings.dart';

class OrderModel {
  final String userId;
  final double payment;
  final List<String> productIds;
  final String city;
  final String addressDetails;

  OrderModel(
      {required this.userId,
      required this.payment,
      required this.productIds,
      required this.city,
      required this.addressDetails});

  factory OrderModel.fromJson(Map json) {
    return OrderModel(
      userId: json[FirebaseKeys.userId],
      payment: json[FirebaseKeys.payment],
      productIds: json[FirebaseKeys.productIds],
      city: json[FirebaseKeys.city],
      addressDetails: json[FirebaseKeys.addressDetails],
    );
  }

  factory OrderModel.empty() {
    return OrderModel(
      userId: "",
      payment: 0.0,
      productIds: [],
      city: "",
      addressDetails: "",
    );
  }
  edit({
    String? userId,
    double? payment,
    List<String>? productIds,
    String? city,
    String? addressDetails,
  }) {
    return OrderModel(
      userId: userId ?? this.userId,
      payment: payment ?? this.payment,
      productIds: productIds ?? this.productIds,
      city: city ?? this.city,
      addressDetails: addressDetails ?? this.addressDetails,
    );
  }

  @override
  String toString() {
    return "OrderModel{userId: $userId, payment: $payment, productIds: $productIds, city: $city, addressDetails: $addressDetails}";
  }
}
