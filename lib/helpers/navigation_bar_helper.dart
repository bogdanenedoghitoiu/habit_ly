import 'package:habit_ly/data/models/navigation_item.dart';

class NavigationBarHelper {
  List<NavigationItem> changeSelectedItem({
    int index = 0,
    required List<NavigationItem> items,
  }) {
    // deselect current item
    items.singleWhere((item) => item.isActive).isActive = false;

    items[index].isActive = true;

    return items;
  }
}
