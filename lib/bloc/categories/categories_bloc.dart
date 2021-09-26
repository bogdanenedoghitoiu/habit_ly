import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_ly/bloc/categories/categories_events.dart';
import 'package:habit_ly/bloc/categories/categories_states.dart';
import 'package:habit_ly/data/providers/habit_categories_provider.dart';

class HabitCategoriesBloc extends Bloc<HabitCategoryEvent, HabitCategoryState> {
  final HabitCategoriesProvider habitCategoriesProvider;

  HabitCategoriesBloc(this.habitCategoriesProvider)
      : super(HabitCategoriesLoading());

  @override
  Stream<HabitCategoryState> mapEventToState(HabitCategoryEvent event) async* {
    switch (event.runtimeType) {
      case PopulateHabitCategories:
      default:
        final habitCategories =
            await habitCategoriesProvider.fetchHabitCategories();

        yield HabitCategoriesSuccess(habitCategories);
        break;
    }
  }
}
