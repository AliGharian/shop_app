import 'package:shop_app/features/authentication/presentation/logic/form_submission_state.dart';

class SignUpState {
  final String fullName;
  final String email;
  final String password;
  final String passwordAgain;
  final String fullNameHelper;
  final String emailHelper;
  final String passwordHelper;
  final String passwordAgainHelper;
  final FormSubmissionState formState;

  SignUpState({
    this.fullName = '',
    this.email = '',
    this.password = '',
    this.passwordAgain = '',
    this.fullNameHelper = '',
    this.emailHelper = '',
    this.passwordHelper = '',
    this.passwordAgainHelper = '',
    this.formState = const InitialFormState(),
  });

  SignUpState copyWith({
    String? fullName,
    String? email,
    String? password,
    String? passwordAgain,
    String? fullNameHelper,
    String? emailHelper,
    String? passwordHelper,
    String? passwordAgainHelper,
    FormSubmissionState? formState,
  }) {
    return SignUpState(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
      passwordAgain: passwordAgain ?? this.passwordAgain,
      fullNameHelper: fullNameHelper ?? this.fullNameHelper,
      emailHelper: emailHelper ?? this.emailHelper,
      passwordHelper: passwordHelper ?? this.passwordHelper,
      passwordAgainHelper: passwordAgainHelper ?? this.passwordAgainHelper,
      formState: formState ?? this.formState,
    );
  }
}
