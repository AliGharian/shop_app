import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/util_functions.dart';
import 'package:shop_app/features/authentication/data/repositories/auth_repository_empl.dart';
import 'package:shop_app/features/authentication/presentation/logic/form_submission_state.dart';
import 'package:shop_app/features/authentication/presentation/logic/sign_up_bloc.dart';
import 'package:shop_app/features/authentication/presentation/logic/sign_up_event.dart';
import 'package:shop_app/features/authentication/presentation/logic/sign_up_state.dart';
import 'package:shop_app/features/authentication/presentation/widgets/custom_icons.dart';
import 'package:shop_app/features/authentication/presentation/widgets/form_button.dart';
import 'package:shop_app/features/authentication/presentation/widgets/form_text_field.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RepositoryProvider(
      create: (context) => AuthRepositoryEmpl(),
      child: Scaffold(
        body: BlocProvider<SignUpBloc>(
          create: (context) => SignUpBloc(
            authRepo: context.read<AuthRepositoryEmpl>(),
          ),
          child: BlocListener<SignUpBloc, SignUpState>(
            listener: (context, state) {
              final formState = state.formState;
              if (formState is SubmissionFailed) {
                showSnackBar(context, formState.exception.toString());
              } else if (formState is SubmissionSuccess) {
                Navigator.pushNamed(context, 'home');
              }
            },
            child: SingleChildScrollView(
              child: Container(
                width: size.width,
                margin: EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: size.width * 0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      width: 100,
                      height: 100,
                      image: AssetImage('assets/images/shop_logo.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Let's get started",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        'Create a new account',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: BlocBuilder<SignUpBloc, SignUpState>(
                        builder: (context, state) {
                          return FormTextField(
                            hintTitle: 'Full Name',
                            helperText: state.fullNameHelper,
                            icon: CustomIcons.user,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            readOnly: state.formState is SubmittingState
                                ? true
                                : false,
                            onChanged: (value) {
                              BlocProvider.of<SignUpBloc>(context)
                                  .add(SignUpFullNameChanged(fullName: value));
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: BlocBuilder<SignUpBloc, SignUpState>(
                        builder: (context, state) {
                          return FormTextField(
                              hintTitle: 'Your Email',
                              helperText: state.emailHelper,
                              icon: CustomIcons.email,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              readOnly: state.formState is SubmittingState
                                  ? true
                                  : false,
                              onChanged: (value) {
                                BlocProvider.of<SignUpBloc>(context)
                                    .add(SignUpEmailChanged(email: value));
                              });
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: BlocBuilder<SignUpBloc, SignUpState>(
                        builder: (context, state) {
                          return FormTextField(
                              hintTitle: 'Password',
                              helperText: state.passwordHelper,
                              icon: Icons.lock,
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.next,
                              obscure: true,
                              readOnly: state.formState is SubmittingState
                                  ? true
                                  : false,
                              onChanged: (value) {
                                BlocProvider.of<SignUpBloc>(context).add(
                                    SignUpPasswordChanged(password: value));
                              });
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: BlocBuilder<SignUpBloc, SignUpState>(
                        builder: (context, state) {
                          return FormTextField(
                              hintTitle: 'password again',
                              helperText: state.passwordAgainHelper,
                              icon: Icons.lock,
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                              obscure: true,
                              readOnly: state.formState is SubmittingState
                                  ? true
                                  : false,
                              onChanged: (value) {
                                BlocProvider.of<SignUpBloc>(context).add(
                                    SignUpPasswordAgainChanged(
                                        passwordAgain: value));
                              });
                        },
                      ),
                    ),
                    BlocBuilder<SignUpBloc, SignUpState>(
                      builder: (context, state) {
                        return FormButton(
                          size: size,
                          title: 'Sign Up',
                          onPressed: state.formState is SubmittingState
                              ? null
                              : () {
                                  BlocProvider.of<SignUpBloc>(context)
                                      .add(SignUpButtonPressed());
                                },
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 32.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Have an account? "),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
