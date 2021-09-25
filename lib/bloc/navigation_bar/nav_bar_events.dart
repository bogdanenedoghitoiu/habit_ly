abstract class NavigationBarEvent {
}

class SelectNavigationItem extends NavigationBarEvent {
  final int index;

  SelectNavigationItem(this.index);

  List<Object> get props => [index];
}

class GenerateDefaultNavigationBar extends NavigationBarEvent {
  List<Object> get props => [];
}