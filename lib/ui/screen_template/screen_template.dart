import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit_ly/configuration/dependency_injection.dart';
import 'package:habit_ly/configuration/global_constants.dart';
import 'package:habit_ly/ui/error/error_screen.dart';
import 'package:habit_ly/ui/home/home_screen.dart';
import 'package:habit_ly/ui/profile/profile_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class ScreenTemplate extends StatefulWidget {
  const ScreenTemplate({Key? key}) : super(key: key);

  @override
  _ScreenTemplateState createState() => _ScreenTemplateState();
}

class _ScreenTemplateState extends State<ScreenTemplate> {
  late PersistentTabController _controller;

  // initialize the navigation controller
  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navigationBarItems(),
        confineInSafeArea: true,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
          ? 0.0
          : kBottomNavigationBarHeight,
        hideNavigationBarWhenKeyboardShows: true,
        margin: EdgeInsets.all(0.0),
        popActionScreens: PopActionScreensType.all,
        bottomScreenMargin: 0.0,
        hideNavigationBar: false,
        decoration: NavBarDecoration(
          colorBehindNavBar: lightPurpleColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        popAllScreensOnTapOfSelectedTab: true,
        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style12,
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      getIt.get<HomeScreen>(),
      getIt.get<GenericErrorScreen>(),
      getIt.get<ProfileScreen>(),
    ];
  }

  List<PersistentBottomNavBarItem> _navigationBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: primaryPurpleColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.arrow_2_squarepath),
        title: ("Habits"),
        activeColorPrimary: primaryPurpleColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.person),
        title: ("Person"),
        activeColorPrimary: primaryPurpleColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}
