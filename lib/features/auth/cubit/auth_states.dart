class AuthState{}

class AuthInitialState extends AuthState{}

class IconButtonEyeChangeState extends AuthState{}

class CheckBoxTermAndConditionsChangeState extends AuthState{}

class SignUpLoading extends AuthState{}

class SignUpSuccess extends AuthState{}

class SignUpFailure extends AuthState{
  final String errorMessage;

  SignUpFailure({required this.errorMessage});
}

class SignInLoading extends AuthState{}

class SignInSuccess extends AuthState{}

class SignInFailure extends AuthState{
  final String errorMessage;

  SignInFailure({required this.errorMessage});
}

class ResetPasswordLoading extends AuthState{}

class ResetPasswordSuccess extends AuthState{}

class ResetPasswordFailure extends AuthState{
  final String errorMessage;

  ResetPasswordFailure({required this.errorMessage});
}