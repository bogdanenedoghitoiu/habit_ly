import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_ly/configuration/dependency_injection.dart';
import 'package:habit_ly/configuration/global_constants.dart';
import 'package:habit_ly/shared_components/account_existence_check.dart';
import 'package:habit_ly/shared_components/rounded_button.dart';
import 'package:habit_ly/shared_components/rounded_password_input.dart';
import 'package:habit_ly/shared_components/rounded_text_input.dart';
import 'package:habit_ly/ui/home/home_screen.dart';
import 'package:habit_ly/ui/profile/profile_screen.dart';
import 'package:habit_ly/ui/screen_template/screen_template.dart';

import 'components/background.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final emailInput = TextEditingController();
    final passwordInput = TextEditingController();

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
                controller: emailInput,
              ),
              RoundedPasswordInput(
                onChanged: (value) {},
                controller: passwordInput,
              ),
              SizedBox(height: size.height * 0.02),
              RoundedButton(
                text: "LOGIN",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => getIt.get<ScreenTemplate>(),
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
                      builder: (context) => getIt.get<ProfileScreen>(),
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
