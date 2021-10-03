import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_ly/configuration/dependency_injection.dart';
import 'package:habit_ly/configuration/global_constants.dart';
import 'package:habit_ly/shared_components/account_existence_check.dart';
import 'package:habit_ly/shared_components/line_divider.dart';
import 'package:habit_ly/shared_components/rounded_button.dart';
import 'package:habit_ly/shared_components/rounded_password_input.dart';
import 'package:habit_ly/shared_components/rounded_text_input.dart';
import 'package:habit_ly/shared_components/social_media_icon.dart';
import 'package:habit_ly/ui/login/login_screen.dart';

import 'components/background.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

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
                "assets/icons/signup.svg",
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
                text: "SIGNUP",
                press: () {}, // TODO add firebase signup logic
                backgroundColor: primaryPurpleColor,
              ),
              SizedBox(height: size.height * 0.01),
              AccountExistenceCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => getIt.get<LoginScreen>(),
                    ),
                  );
                },
              ),
              SizedBox(height: size.height * 0.01),
              LineDivider(text: "OR"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialMediaIcon(
                    iconSource: "assets/icons/google-plus.svg",
                    press: () {}, // TODO add firebase google signup logic
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
