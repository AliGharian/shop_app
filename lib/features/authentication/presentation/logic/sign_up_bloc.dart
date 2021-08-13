import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:shop_app/features/authentication/presentation/logic/form_submission_state.dart';
import 'package:shop_app/features/authentication/presentation/logic/sign_up_event.dart';
import 'package:shop_app/features/authentication/presentation/logic/sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository authRepo;
  SignUpBloc({required this.authRepo}) : super(SignUpState());

  bool validateFullName(String fullName) {
    String pattern = '';
    RegExp fullNameRegEx = RegExp(pattern);
    if (!fullNameRegEx.hasMatch(fullName)) {
      return false;
    }
    return true;
  }

  bool validateEmailAddress(String email) {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp emailRegEx = RegExp(pattern);

    if (!emailRegEx.hasMatch(email)) {
      return false;
    }
    return true;
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

  bool validatePasswordAgain(String a, String b) {
    if (a != b) {
      return false;
    }
    return true;
  }

  String fullNameHelperText(bool isvalid) {
    String fullNameHelperText = '';
    if (!isvalid) fullNameHelperText = 'Please Enter a Valid Name!';
    return fullNameHelperText;
  }

  String emailHelperText(bool isvalid) {
    String emailHelperText = '';
    if (!isvalid) emailHelperText = 'Please Enter a Valid Email!';
    return emailHelperText;
  }

  String passwordHelperText(bool isvalid) {
    String passwordHelperText = '';
    if (!isvalid) passwordHelperText = 'Please Enter a Strong Password!';
    return passwordHelperText;
  }

  String passwordAgainHelperText(bool isvalid) {
    String passwordAgainHelperText = '';
    if (!isvalid) passwordAgainHelperText = 'Two Password Not the Same!';
    return passwordAgainHelperText;
  }

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SignUpFullNameChanged) {
      yield state.copyWith(
        fullName: event.fullName,
        fullNameHelper: fullNameHelperText(validateFullName(event.fullName)),
        formState: InitialFormState(),
      );
    } else if (event is SignUpEmailChanged) {
      yield state.copyWith(
        email: event.email,
        emailHelper: emailHelperText(validateEmailAddress(event.email)),
        formState: InitialFormState(),
      );
    } else if (event is SignUpPasswordChanged) {
      yield state.copyWith(
        password: event.password,
        passwordHelper: passwordHelperText(validatePassword(event.password)),
        passwordAgainHelper: passwordAgainHelperText(
            validatePasswordAgain(event.password, state.passwordAgain)),
        formState: InitialFormState(),
      );
    } else if (event is SignUpPasswordAgainChanged) {
      yield state.copyWith(
        passwordAgain: event.passwordAgain,
        passwordAgainHelper: passwordAgainHelperText(
            validatePasswordAgain(event.passwordAgain, state.password)),
        formState: InitialFormState(),
      );
    } else if (event is SignUpButtonPressed) {
      if (validateFullName(state.fullName) &&
          validateEmailAddress(state.email) &&
          validatePassword(state.password) &&
          validatePasswordAgain(state.password, state.passwordAgain)) {
        yield state.copyWith(
          formState: SubmittingState(),
        );
        try {
          //todo: should handle the return value of this funtion
          await authRepo.signUp(
            fullName: state.fullName,
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
    } else if (event is SignUpHaveAccountPressed) {}
  }
}
