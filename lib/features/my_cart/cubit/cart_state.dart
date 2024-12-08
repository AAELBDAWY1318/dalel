part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

class GetMyCartLoading extends CartState {}

class GetMyCartSuccess extends CartState {
  final List<CartModel> myCartList;

  GetMyCartSuccess({required this.myCartList});
}

class GetMyCartFailure extends CartState {
  final String errorMessage;

  GetMyCartFailure({required this.errorMessage});
}

class ChangePaymentState extends CartState {}

class DeleteFromCartLoading extends CartState {}

class DeleteFromCartSuccess extends CartState {}

class DeleteFromCartFailure extends CartState {
  final String errorMessage;

  DeleteFromCartFailure({required this.errorMessage});
}
