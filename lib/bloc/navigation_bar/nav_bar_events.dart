abstract class NavigationItemEvent {
}

class SelectNavigationItem extends NavigationItemEvent {
  final int index;

  SelectNavigationItem(this.index);

  List<Object> get props => [index];
}

class InitialNavigationItems extends NavigationItemEvent {
  List<Object> get props => [];
}