import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_ly/shared_components/rounded_button.dart';
import 'package:habit_ly/ui/welcome/components/background.dart';

class WelcomeScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Background(
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
            press: () {}, // TODO Navigator.push to LoginScreen()
            backgroundColor: Color(0xFF6F35A5),
          ),
          RoundedButton(
            text: "SIGNUP",
            press: () {}, // TODO Navigatior.push to SignupScreen()
            backgroundColor: Color(0xFFE1C9FF),
            textColor: Colors.black87,
          )
        ],
      ),
    );
  }
}
