import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_ly/bloc/signup/signup_bloc.dart';
import 'package:habit_ly/bloc/signup/signup_events.dart';
import 'package:habit_ly/configuration/dependency_injection.dart';
import 'package:habit_ly/configuration/global_constants.dart';
import 'package:habit_ly/shared_components/rounded_button.dart';
import 'package:habit_ly/ui/login/login_screen.dart';
import 'package:habit_ly/ui/signup/signup_screen.dart';

import 'components/background.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.05),
              SvgPicture.asset(
                "assets/icons/chat.svg",
                height: size.height * 0.45,
              ),
              SizedBox(height: size.height * 0.05),
              RoundedButton(
                text: "LOGIN",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => getIt.get<LoginScreen>(),
                    ),
                  );
                },
                backgroundColor: primaryPurpleColor,
              ),
              RoundedButton(
                text: "SIGNUP",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (_) => getIt.get<SignUpBloc>()
                          ..add(GenerateSignUpScreen()),
                        child: SignUpScreen(),
                      ),
                      // builder: (context) => getIt.get<SignupScreen>(),
                    ),
                  );
                },
                backgroundColor: Color(0xFFE1C9FF),
                textColor: Colors.black87,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
