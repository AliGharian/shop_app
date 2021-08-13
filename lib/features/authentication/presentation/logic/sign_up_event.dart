abstract class SignUpEvent {}

class SignUpFullNameChanged extends SignUpEvent {
  final String fullName;
  SignUpFullNameChanged({required this.fullName});
}

class SignUpEmailChanged extends SignUpEvent {
  final String email;
  SignUpEmailChanged({required this.email});
}

class SignUpPasswordChanged extends SignUpEvent {
  final String password;
  SignUpPasswordChanged({required this.password});
}

class SignUpPasswordAgainChanged extends SignUpEvent {
  final String passwordAgain;
  SignUpPasswordAgainChanged({required this.passwordAgain});
}

class SignUpButtonPressed extends SignUpEvent {}

class SignUpHaveAccountPressed extends SignUpEvent {}
