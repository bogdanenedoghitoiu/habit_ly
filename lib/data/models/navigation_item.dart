import 'package:flutter/cupertino.dart';

class NavigationItem {
  final int id;
  final String icon;
  final Widget? destination;
  bool isActive;

  NavigationItem({
    required this.id,
    required this.icon,
    this.destination,
    this.isActive = false,
  });
}
