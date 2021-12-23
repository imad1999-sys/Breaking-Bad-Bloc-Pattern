import 'package:bloc_pattern_app/app_router.dart';
import 'package:bloc_pattern_app/logic/characters_bloc.dart';
import 'package:bloc_pattern_app/repository/characters_repository.dart';
import 'screens/main_screen/characters_screen.dart';
import 'package:bloc_pattern_app/services/characters_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(appRouter: AppRouter(),));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({Key? key , required this.appRouter}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: appRouter.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
