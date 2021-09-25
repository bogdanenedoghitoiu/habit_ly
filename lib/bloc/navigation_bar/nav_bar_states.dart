import 'package:habit_ly/data/models/navigation_item.dart';

abstract class NavigationBarState {}

class NavigationBarLoading extends NavigationBarState {
  List<Object> get props => [];
}

class NavigationBarLoaded extends NavigationBarState {
  final List<NavigationItem> _navigationItems;

  NavigationBarLoaded(this._navigationItems);

  List<NavigationItem> get props => _navigationItems;
}