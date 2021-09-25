import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_ly/bloc/navigation_bar/nav_bar_states.dart';
import 'package:habit_ly/data/models/navigation_item.dart';
import 'package:habit_ly/data/providers/nav_bar_item_provider.dart';

import 'nav_bar_events.dart';

class NavigationBarBloc extends Bloc<NavigationBarEvent, NavigationBarState> {
  final NavigationBarItemProvider navigationBarItemProvider;

  // TODO move to service
  List<NavigationItem> _navigationBarItems = [];

  List<NavigationItem> get items => _navigationBarItems;

  NavigationBarBloc(this.navigationBarItemProvider)
      : super(NavigationBarLoading());

  @override
  Stream<NavigationBarState> mapEventToState(NavigationBarEvent event) async* {
    switch(event.runtimeType) {
      case SelectNavigationItem:
        changeSelectedItem(index: (event as SelectNavigationItem).index);
    }

    if (event is GenerateDefaultNavigationBar) {
      _navigationBarItems =
          await navigationBarItemProvider.getDummyNavBarItems();

      yield generateLoadedState();
    } else if (event is SelectNavigationItem) {
      changeSelectedItem(index: event.index);

      yield generateLoadedState();
    }
  }

  // TODO move to service

  void changeSelectedItem({int index = 0}) {
    // deselect current item
    _navigationBarItems.singleWhere((item) => item.isActive).isActive = false;

    _navigationBarItems[index].isActive = true;
  }

  NavigationBarLoaded generateLoadedState() {
    return NavigationBarLoaded(_navigationBarItems);
  }
}
