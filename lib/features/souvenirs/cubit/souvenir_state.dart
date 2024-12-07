part of 'souvenir_cubit.dart';

@immutable
sealed class SouvenirState {}

final class SouvenirInitial extends SouvenirState {}

class AddToCartSuccessState extends SouvenirState {}

class AddToCartLoadingState extends SouvenirState {}

class AddToCartFailureState extends SouvenirState {
  final String message;

  AddToCartFailureState({required this.message});
}
