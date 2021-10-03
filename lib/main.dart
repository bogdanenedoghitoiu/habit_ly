import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_ly/ui/welcome/welcome_screen.dart';

import 'bloc/bloc_observer.dart';
import 'configuration/dependency_injection.dart';

void main() {
  configureDependencies();
  Bloc.observer = DefaultBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Habit_ly',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(color: Colors.white, elevation: 0),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home:  getIt.get<WelcomeScreen>(),
      ),
    );
  }
}
