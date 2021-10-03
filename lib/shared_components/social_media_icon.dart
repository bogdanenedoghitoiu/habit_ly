import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_ly/configuration/global_constants.dart';

class SocialMediaIcon extends StatelessWidget {
  final String iconSource;
  final Function press;

  const SocialMediaIcon({
    Key? key,
    required this.iconSource,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: primaryPurpleColor,
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          iconSource,
          height: 20,
          width: 20,
        ),
      ),
      onTap: () => press(),
    );
  }
}
