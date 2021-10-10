import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_ly/ui/welcome/welcome_screen.dart';

import 'bloc/bloc_observer.dart';
import 'configuration/dependency_injection.dart';

void main() {
  configureDependencies();
  Bloc.observer = DefaultBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

// TODO bloc architecture
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _firebaseInitialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _firebaseInitialization,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return Container(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Habit_ly',
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(color: Colors.white, elevation: 0),
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: Scaffold(
                body: Text("Error."),
              ),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Habit_ly',
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(color: Colors.white, elevation: 0),
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: getIt.get<WelcomeScreen>(),
            ),
          );
        }

        return Container(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Habit_ly',
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(color: Colors.white, elevation: 0),
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: Scaffold(
              body: Text("Loading."),
            ),
          ),
        );
      },
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Habit_ly',
//         theme: ThemeData(
//           scaffoldBackgroundColor: Colors.white,
//           appBarTheme: AppBarTheme(color: Colors.white, elevation: 0),
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         home:  getIt.get<WelcomeScreen>(),
//       ),
//     );
//   }
// }
