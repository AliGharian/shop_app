import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/authentication/data/repositories/auth_repository_empl.dart';
import 'package:shop_app/features/authentication/presentation/logic/form_submission_state.dart';
import 'package:shop_app/features/authentication/presentation/logic/login_bloc.dart';
import 'package:shop_app/features/authentication/presentation/logic/login_event.dart';
import 'package:shop_app/features/authentication/presentation/logic/login_state.dart';
import 'package:shop_app/features/authentication/presentation/widgets/custom_icons.dart';
import 'package:shop_app/features/authentication/presentation/widgets/form_button.dart';
import 'package:shop_app/features/authentication/presentation/widgets/form_text_field.dart';
import 'package:shop_app/features/authentication/presentation/widgets/login_with_button.dart';
import 'package:shop_app/features/authentication/presentation/widgets/single_line.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RepositoryProvider(
      create: (context) => AuthRepositoryEmpl(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(
            authRepo: context.read<AuthRepositoryEmpl>(),
          ),
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              final formState = state.formState;
              if (formState is SubmissionFailed) {
                _showSnackBar(context, formState.exception.toString());
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
                      image: NetworkImage(
                          'https://cdn.statically.io/img/cdn6.aptoide.com/split-store/d1cba38ca74462bd5a62457f9ec77e85_icon.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Welcome to E-com',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        'Sign in to continue',
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return FormTextField(
                            hintTitle: 'Your Email',
                            helperText: state.emailHelper,
                            icon: CustomIcons.email,
                            readOnly: state.formState is SubmittingState
                                ? true
                                : false,
                            onChanged: (value) {
                              BlocProvider.of<LoginBloc>(context)
                                  .add(LoginEmailChanged(email: value));
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return FormTextField(
                            hintTitle: 'Your Password',
                            helperText: state.passwordHelper,
                            icon: Icons.lock,
                            readOnly: state.formState is SubmittingState
                                ? true
                                : false,
                            onChanged: (value) {
                              BlocProvider.of<LoginBloc>(context)
                                  .add(LoginPasswordChanged(password: value));
                            },
                          );
                        },
                      ),
                    ),
                    BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return FormButton(
                          size: size,
                          title: 'Sign In',
                          onPressed: state.formState is SubmittingState
                              ? null
                              : () {
                                  BlocProvider.of<LoginBloc>(context)
                                      .add(LoginButtonPressed());
                                },
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SingleLine(size: size),
                          Text('OR'),
                          SingleLine(size: size),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return LoginWithButton(
                            size: size,
                            title: 'Login with Google',
                            icon: CustomIcons.google,
                            iconColor: Colors.deepOrange,
                            onPressed: state.formState is SubmittingState
                                ? null
                                : () {
                                    BlocProvider.of<LoginBloc>(context)
                                        .add(LoginWithGooglePressed());
                                  },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return LoginWithButton(
                            size: size,
                            title: 'Login with Facebook',
                            icon: CustomIcons.facebook,
                            iconColor: Colors.blue,
                            onPressed: state.formState is SubmittingState
                                ? null
                                : () {
                                    BlocProvider.of<LoginBloc>(context)
                                        .add(LoginWithFacebookPressed());
                                  },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          'Forget Password?',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have a account? "),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, 'signUp');
                            },
                            child: Text(
                              'Register',
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

//todo: should move to a correct directory
void _showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(content: Text(message.toString()));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
