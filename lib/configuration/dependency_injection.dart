import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:habit_ly/bloc/categories/categories_bloc.dart';
import 'package:habit_ly/bloc/login/login_bloc.dart';
import 'package:habit_ly/bloc/navigation_bar/nav_bar_bloc.dart';
import 'package:habit_ly/bloc/signup/signup_bloc.dart';
import 'package:habit_ly/data/providers/habit_categories_provider.dart';
import 'package:habit_ly/data/providers/nav_bar_item_provider.dart';
import 'package:habit_ly/data/repositories/firebase_auth_repository.dart';
import 'package:habit_ly/helpers/navigation_bar_helper.dart';
import 'package:habit_ly/ui/error/error_screen.dart';
import 'package:habit_ly/ui/home/home_screen.dart';
import 'package:habit_ly/ui/login/login_screen.dart';
import 'package:habit_ly/ui/profile/profile_screen.dart';
import 'package:habit_ly/ui/screen_template/screen_template.dart';
import 'package:habit_ly/ui/signup/signup_screen.dart';
import 'package:habit_ly/ui/welcome/welcome_screen.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  // google sign in
  getIt.registerLazySingleton<GoogleSignIn>(
    () => GoogleSignIn(
      scopes: <String>[
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    ),
  );

  // repositories
  getIt.registerLazySingleton<FirebaseAuthRepository>(
    () => FirebaseAuthRepository(
      getIt.get<GoogleSignIn>(),
    ),
  );

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

  getIt.registerFactory<LogInBloc>(
    () => LogInBloc(
      getIt.get<FirebaseAuthRepository>(),
    ),
  );

  getIt.registerFactory<SignUpBloc>(
    () => SignUpBloc(
      getIt.get<FirebaseAuthRepository>(),
    ),
  );

  // screens
  getIt.registerLazySingleton(() => WelcomeScreen());
  getIt.registerLazySingleton(() => LogInScreen());
  getIt.registerLazySingleton(() => SignUpScreen());
  getIt.registerLazySingleton(() => HomeScreen());
  getIt.registerLazySingleton(() => GenericErrorScreen());
  getIt.registerLazySingleton(() => ProfileScreen());
  getIt.registerLazySingleton(() => ScreenTemplate());
}
