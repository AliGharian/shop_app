import 'package:flutter/material.dart';
import 'package:shop_app/consts/theme_data.dart';
import 'package:shop_app/features/authentication/presentation/pages/splash_page.dart';
import 'package:shop_app/pages/bottom_nav_bar_page.dart';
import 'features/authentication/presentation/pages/login_page.dart';
import 'features/authentication/presentation/pages/sign_up_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop App',
      debugShowCheckedModeBanner: false,
      theme: Styles.themData(false, context),
      //home: BottomNavBarPage(),
      routes: {
        '/': (context) => SplashPage(),
        // '/': (context) => LoginPage(),
        'home': (context) => BottomNavBarPage(),
        'login': (context) => LoginPage(),
        'signUp': (context) => SignUpPage(),
      },
    );
  }
}
