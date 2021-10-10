import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_ly/bloc/signup/signup_bloc.dart';
import 'package:habit_ly/bloc/signup/signup_events.dart';
import 'package:habit_ly/bloc/signup/signup_states.dart';
import 'package:habit_ly/configuration/dependency_injection.dart';
import 'package:habit_ly/configuration/global_constants.dart';
import 'package:habit_ly/shared_components/account_existence_check.dart';
import 'package:habit_ly/shared_components/line_divider.dart';
import 'package:habit_ly/shared_components/rounded_button.dart';
import 'package:habit_ly/shared_components/rounded_password_input.dart';
import 'package:habit_ly/shared_components/rounded_text_input.dart';
import 'package:habit_ly/shared_components/social_media_icon.dart';
import 'package:habit_ly/ui/home/home_screen.dart';
import 'package:habit_ly/ui/login/login_screen.dart';

import 'components/background.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SignUpBloc>(context);

    return Scaffold(
      body: Background(
        child: _buildBlocBuilder(bloc),
      ),
    );
  }

  Widget _buildBlocBuilder(SignUpBloc bloc) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          // TODO show alert on top of SignUpScreen UI
          case SignUpSuccess:
            return _buildSignUpDialog(context);
          case SignUpLoaded:
            return _buildSignUpElements(context, bloc);
          case SignUpLoading:
          default:
            return _buildLoadingWidget();
        }
      },
    );
  }

  AlertDialog _buildSignUpDialog(BuildContext context) {
    return AlertDialog(
            title: Text('SUCCESS'),
            content: Text('You are now signed up.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => getIt.get<HomeScreen>(),
                    ),
                  );
                },
                child: Text("OK"),
              ),
            ],
          );
  }

  SingleChildScrollView _buildSignUpElements(
      BuildContext context, SignUpBloc bloc) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
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
            press: () {
              bloc.add(
                SignUp('bogdanenedoghitoiu@gmail.com', 'TsunamiFTW3214.'),
              );
            },
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
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
