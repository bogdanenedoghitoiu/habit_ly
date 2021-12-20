import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_ly/bloc/categories/categories_bloc.dart';
import 'package:habit_ly/bloc/categories/categories_events.dart';
import 'package:habit_ly/bloc/navigation_bar/nav_bar_bloc.dart';
import 'package:habit_ly/bloc/navigation_bar/nav_bar_events.dart';
import 'package:habit_ly/configuration/dependency_injection.dart';
import 'package:habit_ly/configuration/size_configuration.dart';
import 'package:habit_ly/shared_components/custom_app_bar.dart';
import 'package:habit_ly/shared_components/custom_navigation_bar.dart';
import 'package:habit_ly/ui/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: CustomApplicationBar(),
      body: BlocProvider(
        create: (_) =>
            getIt.get<HabitCategoriesBloc>()..add(PopulateHabitCategories()),
        child: HomeScreenBody(),
      ),
      // bottomNavigationBar: BlocProvider(
      //   create: (_) =>
      //       getIt.get<NavigationBarBloc>()..add(GenerateDefaultNavigationBar()),
      //   child: CustomNavigationBar(),
      // ),
    );
  }
}
