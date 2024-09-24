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