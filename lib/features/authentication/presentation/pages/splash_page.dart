import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/util_functions.dart';
import 'package:shop_app/features/authentication/presentation/logic/splash_bloc_test.dart';
import 'package:shop_app/features/authentication/presentation/logic/splash_state.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      //todo: should change this line and handle with themes
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => SplashBloc(),
        child: BlocListener<SplashBloc, SplashState>(
          listener: (context, state) {
            if (state is GoToHome) {
              Navigator.pushNamedAndRemoveUntil(
                  context, 'home', (route) => false);
            } else if (state is GoToSignIn) {
              Navigator.pushNamedAndRemoveUntil(
                  context, 'login', (route) => false);
            } else if (state is NotInternet) {
              showSnackBar(context, 'Internet Access Failed!');
            }
          },
          child: Center(
            child: Container(
              child: Image(
                width: size.width * 0.5,
                height: size.width * 0.5,
                image: AssetImage('assets/images/shop_logo.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
