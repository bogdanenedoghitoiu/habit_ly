import 'package:get_it/get_it.dart';
import 'package:habit_ly/bloc/categories/categories_bloc.dart';
import 'package:habit_ly/bloc/navigation_bar/nav_bar_bloc.dart';
import 'package:habit_ly/data/providers/habit_categories_provider.dart';
import 'package:habit_ly/data/providers/nav_bar_item_provider.dart';
import 'package:habit_ly/helpers/navigation_bar_helper.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  // providers
  getIt.registerLazySingleton<NavigationBarItemProvider>(
    () => NavigationBarItemProvider(),
  );

  getIt.registerLazySingleton<HabitCategoriesProvider>(
    () => HabitCategoriesProvider(),
  );

  // helpers
  getIt.registerLazySingleton<NavigationBarHelper>(
    () => NavigationBarHelper(),
  );

  // blocs
  getIt.registerFactory<NavigationBarBloc>(
    () => NavigationBarBloc(
      getIt.get<NavigationBarItemProvider>(),
      getIt.get<NavigationBarHelper>(),
    ),
  );

  getIt.registerFactory<HabitCategoriesBloc>(
    () => HabitCategoriesBloc(
      getIt.get<HabitCategoriesProvider>(),
    ),
  );
}
