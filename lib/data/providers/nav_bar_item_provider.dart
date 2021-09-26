import 'package:habit_ly/data/models/navigation_item.dart';
import 'package:habit_ly/ui/home/home_screen.dart';

class NavigationBarItemProvider {
  Future<List<NavigationItem>> getDummyNavBarItems() async {
    return [
      NavigationItem(
        id: 1,
        icon: "assets/icons/home.svg",
        destination: HomeScreen(),
        isActive: true,
      ),
      NavigationItem(
        id: 2,
        icon: "assets/icons/list.svg",
      ),
      NavigationItem(
        id: 3,
        icon: "assets/icons/user.svg",
      ),
    ];
  }
}
