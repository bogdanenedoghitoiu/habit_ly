import 'package:flutter/material.dart';
import 'package:habit_ly/configuration/global_constants.dart';

class AccountExistenceCheck extends StatelessWidget {
final bool login;
final Function press;

const AccountExistenceCheck({
Key? key,
this.login = true,
required this.press,
}) : super(key: key);

@override
Widget build(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        login ? "Already have an account? " : "Don't have an account? ",
        style: TextStyle(
          color: primaryPurpleColor,
        ),
      ),
      GestureDetector(
        onTap: () => press(),
        child: Text(
          login ? "Sign in!" : "Sign up!",
          style: TextStyle(
            color: primaryPurpleColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
}
