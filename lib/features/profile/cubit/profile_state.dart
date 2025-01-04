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

class UploadImageFailure extends ProfileState{
  final String errorMessage;

  UploadImageFailure({required this.errorMessage});
}

class UpdateUserInfoSuccess extends ProfileState{
  final Map data;

  UpdateUserInfoSuccess({required this.data});
}

class UpdateUserInfoFailure extends ProfileState{
  final String errorMessage;

  UpdateUserInfoFailure({required this.errorMessage});
}

class UpdateInfoLoading extends ProfileState{}

class UpdateInfoSuccess extends ProfileState{}

class LogoutSuccess extends ProfileState{}

class LogoutLoading extends ProfileState{}

class LogoutFailure extends ProfileState{
  final String errorMessage;

  LogoutFailure({required this.errorMessage});
}
