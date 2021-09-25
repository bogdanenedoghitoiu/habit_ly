import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_ly/bloc/navigation_bar/nav_bar_states.dart';
import 'package:habit_ly/data/models/navigation_item.dart';
import 'package:habit_ly/data/providers/nav_bar_item_provider.dart';

import 'nav_bar_events.dart';

class NavigationBarBloc extends Bloc<NavigationBarEvent, NavigationBarState> {
  final NavigationBarItemProvider navigationBarItemProvider;

  // TODO find better way of structuring the navigation bar items
  List<NavigationItem> navigationBarItems = [];

  List<NavigationItem> get items => navigationBarItems;

  NavigationBarBloc(this.navigationBarItemProvider)
      : super(NavigationBarLoading());

  @override
  Stream<NavigationBarState> mapEventToState(NavigationBarEvent event) async* {
    if (event is GenerateDefaultNavigationBar) {
      navigationBarItems = await fetchNavigationBarItems();

      yield generateLoadedState(0);
    } else if (event is SelectNavigationItem) {
      yield generateLoadedState(event.index);
    }
  }

  Future<List<NavigationItem>> fetchNavigationBarItems() async {
    return await navigationBarItemProvider.getDummyNavBarItems();
  }

  NavigationBarLoaded generateLoadedState(int index) {
    // deselect current item
    navigationBarItems
        .singleWhere((item) => item.isActive)
        .isActive = false;

    navigationBarItems[index].isActive = true;

    return NavigationBarLoaded(navigationBarItems);
  }
}
