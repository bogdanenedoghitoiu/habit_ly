import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habit_ly/configuration/size_configuration.dart';

class CustomApplicationBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomApplicationBar({Key? key})
      : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {},
      ),
      title: Container(
        padding: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 5.0,
        ),
        height: 60,
        width: 90,
        child: SvgPicture.asset("assets/icons/habit_ly_logo.svg"),
      ),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/search.svg")),
        SizedBox(width: SizeConfig.defaultSize * 0.5),
      ],
    );
  }
}
