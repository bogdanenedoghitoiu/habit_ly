import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit_ly/ui/welcome/components/body.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WelcomeScreenBody(),
    );
  }
}
