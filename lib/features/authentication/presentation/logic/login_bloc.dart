import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:shop_app/features/authentication/presentation/logic/form_submission_state.dart';
import 'package:shop_app/features/authentication/presentation/logic/login_event.dart';
import 'package:shop_app/features/authentication/presentation/logic/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepo;
  LoginBloc({required this.authRepo}) : super(LoginState());

  bool validateEmailAddress(String email) {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp emailRegEx = RegExp(pattern);

    if (!emailRegEx.hasMatch(email)) {
      return false;
    }
    return true;
  }

  String emailHelperText(bool isvalid) {
    String emailHelperText = '';
    if (!isvalid) emailHelperText = 'Please Enter a Valid Email!';
    return emailHelperText;
  }

  bool validatePassword(String password) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp passRegEx = RegExp(pattern);

    if (!passRegEx.hasMatch(password)) {
      return false;
    }
    return true;
  }

  String passwordHelperText(bool isvalid) {
    String passwordHelperText = '';
    if (!isvalid) passwordHelperText = 'Please Enter a Strong Password!';
    return passwordHelperText;
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginEmailChanged) {
      yield state.copyWith(
        email: event.email,
        emailHelper: emailHelperText(validateEmailAddress(event.email)),
        formState: InitialFormState(),
      );
    } else if (event is LoginPasswordChanged) {
      yield state.copyWith(
        password: event.password,
        passwordHelper: passwordHelperText(validatePassword(event.password)),
        formState: InitialFormState(),
      );
    } else if (event is LoginButtonPressed) {
      if (validateEmailAddress(state.email) &&
          validatePassword(state.password)) {
        yield state.copyWith(
          formState: SubmittingState(),
        );

        try {
          //todo: should hand the return value of this funtion
          await authRepo.login(
            email: state.email,
            password: state.password,
          );
          yield state.copyWith(
            formState: SubmissionSuccess(),
          );
        } catch (e) {
          yield state.copyWith(
            formState: SubmissionFailed(Exception(e)),
          );
        }
      }
    } else if (event is LoginWithGooglePressed) {
    } else if (event is LoginWithGooglePressed) {
    } else if (event is LoginForgetPasswordPressed) {
    } else if (event is LoginRegisterPressed) {}
  }
}
