import 'package:habit_ly/data/models/navigation_item.dart';

abstract class NavigationBarState {}

class NavigationBarLoading extends NavigationBarState {
  List<Object> get props => [];
}

class NavigationBarLoaded extends NavigationBarState {
  final List<NavigationItem> navigationItems;

  NavigationBarLoaded(this.navigationItems);

  List<Object> get props => [navigationItems];
}