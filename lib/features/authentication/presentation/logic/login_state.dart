import 'package:shop_app/features/authentication/presentation/logic/form_submission_state.dart';

class LoginState {
  final String email;
  final String password;
  final String emailHelper;
  final String passwordHelper;
  final FormSubmissionState formState;

  LoginState({
    this.email = '',
    this.password = '',
    this.emailHelper = '',
    this.passwordHelper = '',
    this.formState = const InitialFormState(),
  });

  LoginState copyWith({
    String? email,
    String? password,
    String? emailHelper,
    String? passwordHelper,
    FormSubmissionState? formState,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      emailHelper: emailHelper ?? this.emailHelper,
      passwordHelper: passwordHelper ?? this.passwordHelper,
      formState: formState ?? this.formState,
    );
  }
}
