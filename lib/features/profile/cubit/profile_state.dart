part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

class GetUserDataLoading extends ProfileState {}

class GetUserDataSuccess extends ProfileState {
  final String firstName, lastName, image, email;

  GetUserDataSuccess(
      {required this.firstName,
      required this.lastName,
      required this.image,
      required this.email});
}

class GetUserDataFailure extends ProfileState {
  final String errorMessage;

  GetUserDataFailure({required this.errorMessage});
}

class PickImageFailure extends ProfileState{
  final String errorMessage;

  PickImageFailure({required this.errorMessage});
}
