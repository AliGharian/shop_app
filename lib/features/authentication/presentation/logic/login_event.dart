abstract class LoginEvent {}

class LoginEmailChanged extends LoginEvent {
  final String email;
  LoginEmailChanged({required this.email});
}

class LoginPasswordChanged extends LoginEvent {
  final String password;
  LoginPasswordChanged({required this.password});
}

class LoginButtonPressed extends LoginEvent {}

class LoginWithGooglePressed extends LoginEvent {}

class LoginWithFacebookPressed extends LoginEvent {}

class LoginForgetPasswordPressed extends LoginEvent {}

class LoginRegisterPressed extends LoginEvent {}
