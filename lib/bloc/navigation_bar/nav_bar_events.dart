import 'package:habit_ly/data/models/navigation_item.dart';

abstract class NavigationBarEvent {
}

class SelectNavigationItem extends NavigationBarEvent {
  final int index;
  final List<NavigationItem> items;

  SelectNavigationItem(this.index, this.items);
}

class GenerateDefaultNavigationBar extends NavigationBarEvent {
  List<Object> get props => [];
}