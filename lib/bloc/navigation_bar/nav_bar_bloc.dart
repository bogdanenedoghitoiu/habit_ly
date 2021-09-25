import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_ly/bloc/navigation_bar/nav_bar_states.dart';
import 'package:habit_ly/data/providers/nav_bar_item_provider.dart';
import 'package:habit_ly/helpers/navigation_bar_helper.dart';

import 'nav_bar_events.dart';

class NavigationBarBloc extends Bloc<NavigationBarEvent, NavigationBarState> {
  final NavigationBarItemProvider navigationBarItemProvider;
  final NavigationBarHelper navigationBarHelper;

  NavigationBarBloc(this.navigationBarItemProvider, this.navigationBarHelper)
      : super(NavigationBarLoading());

  @override
  Stream<NavigationBarState> mapEventToState(NavigationBarEvent event) async* {
    switch (event.runtimeType) {
      case SelectNavigationItem:
        final selectItemEvent = event as SelectNavigationItem;

        final navigationItems = navigationBarHelper.changeSelectedItem(
          index: selectItemEvent.index,
          items: selectItemEvent.items,
        );

        yield NavigationBarLoaded(navigationItems);
        break;
      case GenerateDefaultNavigationBar:
      default:
        final navigationBarItems =
            await navigationBarItemProvider.getDummyNavBarItems();

        yield NavigationBarLoaded(navigationBarItems);
        break;
    }
  }
}
