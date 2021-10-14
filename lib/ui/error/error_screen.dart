import 'package:flutter/material.dart';

class GenericErrorScreen extends StatelessWidget {
  const GenericErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/error-image.png",
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
