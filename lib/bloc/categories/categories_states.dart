import 'package:habit_ly/data/providers/habit_categories_provider.dart';

abstract class HabitCategoryState {}

class HabitCategoriesLoading extends HabitCategoryState {
  List<CategoryBundle> _categories = [];

  List<CategoryBundle> get props => _categories;
}

class HabitCategoriesSuccess extends HabitCategoryState {
  List<CategoryBundle> _categories;

  HabitCategoriesSuccess(this._categories);

  List<CategoryBundle> get props => _categories;
}