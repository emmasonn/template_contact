import 'package:flutter/material.dart';
import 'package:flutter_app/core/navigation/app_route_parser.dart';
import 'package:flutter_app/core/navigation/app_router.dart';

void main() {
  runApp(const AppTemplate());
}

class AppTemplate extends StatefulWidget {
  const AppTemplate({Key? key}) : super(key: key);

  @override
  State<AppTemplate> createState() => _AppTemplateState();
}

class _AppTemplateState extends State<AppTemplate> {
  final routeParser = AppRouteParser();
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    //decide on which theme to use on the app whether dark or light.
    // ThemeData themeData;
    // if (themeTemp) {
    //   themeData = AppTheme.dark();
    // } else {
    //   themeData = AppTheme.light();
    // }

    return MaterialApp.router(
      title: 'AppTemplate',
      routeInformationParser: routeParser,
      routerDelegate:
          _appRouter, //helps to construct the stack of pages that represents your app state.
    );
  } 
} 
 