part of 'check_out_cubit.dart';

@immutable
sealed class CheckOutState {}

final class CheckOutInitial extends CheckOutState {}

class GetListOfProductLoading extends CheckOutState {}

class GetListProductSuccess extends CheckOutState {
  final List<SouvenirModel> products;

  GetListProductSuccess({required this.products});
}

class GetListOfProductFailure extends CheckOutState {
  final String errorMessage;

  GetListOfProductFailure({required this.errorMessage});
}

class GetAddressLoading extends CheckOutState {}

class GetAddressSuccess extends CheckOutState {
  final String city, addressdetails;

  GetAddressSuccess({required this.city, required this.addressdetails});
}

class GetAddressFailure extends CheckOutState {
  final String errorMessage;

  GetAddressFailure({required this.errorMessage});
}

class GetUserDataLoading extends CheckOutState {}

class GetUserDataSuccess extends CheckOutState {
  final String firstName, lastName, email;

  GetUserDataSuccess(
      {required this.firstName, required this.lastName, required this.email});
}

class GetUserDataFailure extends CheckOutState {
  final String errorMessage;

  GetUserDataFailure({required this.errorMessage});
}

class ConfirmPaymentLoading extends CheckOutState{}

class ConfirmPaymentSuccess extends CheckOutState{}

class ConfirmPaymentFailure extends CheckOutState{
  final String errorMessage;

  ConfirmPaymentFailure({required this.errorMessage});
}


