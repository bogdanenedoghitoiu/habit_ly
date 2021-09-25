import 'package:habit_ly/data/models/navigation_item.dart';

abstract class NavigationBarState {}

class NavigationBarInitial extends NavigationBarState {
  final List<NavigationItem> navigationItems;

  NavigationBarInitial(this.navigationItems);

  List<Object> get props => [];
}

class NavigationBarLoading extends NavigationBarState {
  List<Object> get props => [];
}

class NavigationBarSuccess extends NavigationBarState {
  final List<NavigationItem> navigationItems;

  NavigationBarSuccess(this.navigationItems);

  List<Object> get props => [navigationItems];
}