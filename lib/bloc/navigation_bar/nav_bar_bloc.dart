import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_ly/bloc/navigation_bar/nav_bar_states.dart';
import 'package:habit_ly/data/models/navigation_item.dart';
import 'package:habit_ly/data/providers/nav_bar_item_provider.dart';

import 'nav_bar_events.dart';

class NavigationBarBloc extends Bloc<NavigationItemEvent, NavigationBarState> {

  // TODO add dependency injection
  final NavigationBarItemProvider navigationBarItemProvider = NavigationBarItemProvider();

  // TODO find better way of structuring the navigation bar items
  List<NavigationItem> navigationBarItems = [];
  List<NavigationItem> get items => navigationBarItems;

  NavigationBarBloc(NavigationBarState initialState) : super(NavigationBarLoading());

  @override
  Stream<NavigationBarState> mapEventToState(NavigationItemEvent event) async* {
    if (event is InitialNavigationItems) {
      yield generateSuccessState(0);
    } else if (event is SelectNavigationItem) {
      yield generateSuccessState(event.index);
    }
  }

  NavigationBarSuccess generateSuccessState(int index) {
    navigationBarItems = navigationBarItemProvider.getDummyNavBarItems();

    navigationBarItems[index].isActive = true;

    return NavigationBarSuccess(navigationBarItems);
  }

}