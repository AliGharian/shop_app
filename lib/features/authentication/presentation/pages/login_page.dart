import 'package:flutter/material.dart';
import 'package:shop_app/features/authentication/presentation/widgets/custom_icons.dart';
import 'package:shop_app/features/authentication/presentation/widgets/login_text_field.dart';
import 'package:shop_app/features/authentication/presentation/widgets/login_with_button.dart';
import 'package:shop_app/features/authentication/presentation/widgets/single_line.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                child: LoginTextField(
                  hintTitle: 'Your Email',
                  icon: CustomIcons.email,
                  onChanged: (value) {},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: LoginTextField(
                  hintTitle: 'Your Password',
                  icon: Icons.lock,
                  onChanged: (value) {},
                ),
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                elevation: 5.0,
                minWidth: size.width,
                height: 50.0,
                color: Colors.blue,
                child: Text(
                  'Sign In',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
                onPressed: () {},
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
                child: LoginWithButton(
                  size: size,
                  title: 'Login with Google',
                  icon: CustomIcons.google,
                  iconColor: Colors.deepOrange,
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: LoginWithButton(
                  size: size,
                  title: 'Login with Facebook',
                  icon: CustomIcons.facebook,
                  iconColor: Colors.blue,
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Forget Password?',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
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
                      onTap: () {},
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
    );
  }
}
