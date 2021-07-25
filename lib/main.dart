import 'package:flutter/material.dart';
import 'package:shop_app/consts/theme_data.dart';
import 'package:shop_app/pages/bottom_nav_bar_page.dart';
import 'features/login/presentation/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Styles.themData(false, context),
      //home: BottomNavBarPage(),
      home: LoginPage(),
    );
  }
}
