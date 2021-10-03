import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit_ly/configuration/global_constants.dart';

class LineDivider extends StatelessWidget {
  final String text;

  const LineDivider({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildDivider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              text,
              style: TextStyle(
                color: primaryPurpleColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
      child: Divider(
        color: lightPurpleColor,
        height: 1.5,
        thickness: 3,
      ),
    );
  }
}
