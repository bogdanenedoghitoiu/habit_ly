import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_ly/configuration/dependency_injection.dart';
import 'package:habit_ly/configuration/global_constants.dart';
import 'package:habit_ly/shared_components/account_existence_check.dart';
import 'package:habit_ly/shared_components/rounded_button.dart';
import 'package:habit_ly/shared_components/rounded_password_input.dart';
import 'package:habit_ly/shared_components/rounded_text_input.dart';
import 'package:habit_ly/ui/home/home_screen.dart';
import 'package:habit_ly/ui/signup/signup_screen.dart';

import 'components/background.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.35,
              ),
              RoundedTextInput(
                hintText: "your e-mail address",
                icon: Icons.person,
                onChanged: (value) {},
              ),
              RoundedPasswordInput(
                onChanged: (value) {},
              ),
              SizedBox(height: size.height * 0.02),
              RoundedButton(
                text: "LOGIN",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => getIt.get<HomeScreen>(),
                    ),
                  );
                },
                backgroundColor: primaryPurpleColor,
              ),
              SizedBox(height: size.height * 0.01),
              AccountExistenceCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => getIt.get<SignUpScreen>(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
