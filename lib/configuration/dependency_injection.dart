import 'package:get_it/get_it.dart';
import 'package:habit_ly/bloc/navigation_bar/nav_bar_bloc.dart';
import 'package:habit_ly/data/providers/nav_bar_item_provider.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerLazySingleton<NavigationBarItemProvider>(
    () => NavigationBarItemProvider(),
  );

  // blocs
  getIt.registerFactory<NavigationBarBloc>(
    () => NavigationBarBloc(
      getIt.get<NavigationBarItemProvider>(),
    ),
  );
}
