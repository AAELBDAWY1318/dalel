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
