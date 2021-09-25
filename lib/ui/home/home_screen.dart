import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_ly/bloc/navigation_bar/nav_bar_bloc.dart';
import 'package:habit_ly/bloc/navigation_bar/nav_bar_events.dart';
import 'package:habit_ly/bloc/navigation_bar/nav_bar_states.dart';
import 'package:habit_ly/components/custom_navigation_bar.dart';
import 'package:habit_ly/configuration/dependency_injection.dart';
import 'package:habit_ly/configuration/size_configuration.dart';
import 'package:habit_ly/ui/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: buildAppBar(),
      body: HomeScreenBody(),
      bottomNavigationBar: BlocProvider(
        create: (_) => getIt.get<NavigationBarBloc>()..add(GenerateDefaultNavigationBar()),
        child: CustomNavigationBar(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {},
      ),
      title: Image.asset("assets/images/logo.png"),
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
