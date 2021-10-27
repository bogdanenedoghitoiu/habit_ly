import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_ly/bloc/navigation_bar/nav_bar_bloc.dart';
import 'package:habit_ly/configuration/dependency_injection.dart';
import 'package:habit_ly/data/models/navigation_item.dart';
import 'package:habit_ly/shared_components/custom_navigation_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationItems = ModalRoute.of(context)!.settings.arguments as List<NavigationItem>;

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      bottomNavigationBar: BlocProvider(
        create: (_) =>
        getIt.get<NavigationBarBloc>(),
        child: getIt.get<CustomNavigationBar>(),
      ),
    );
  }
}
