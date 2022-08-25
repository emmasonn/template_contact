import 'package:flutter/material.dart';
import 'package:flutter_app/core/navigation/router.dart';
import 'package:flutter_app/features/contact/app/provider/contact_manager.dart';
import 'package:flutter_app/injection_container.dart' as di;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart' as pr;
import 'core/resources/app_theme.dart';
import 'injection_container.dart';

// late StateNotifierProvider<ContactManager,ContactsState> contactManagerProvider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //awaiting dependency injection processing
  //using Get_It package
  await di.init();

  // //initialize managers;
  // contactManagerProvider = StateNotifierProvider<ContactManager,ContactsState>(
  //       (ref) => sl<ContactManager>(),
  // );

  runApp(
    const ProviderScope(
      child: AppTemplate(),
    ),
  );
}

class AppTemplate extends ConsumerWidget {
  const AppTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ThemeData themeData;
    //   // if (themeTemp) {
    //   //   themeData = AppTheme.dark();
    //   // } else {
    //   //   themeData = AppTheme.light();
    //   // }

    return pr.MultiProvider(
      providers: [
        pr.ChangeNotifierProvider.value(
          value: sl<ContactManager>(),
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'AppTemplate',
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        routeInformationParser: goRouter.routeInformationParser,
        routeInformationProvider: goRouter.routeInformationProvider,
        routerDelegate: goRouter
            .routerDelegate, //helps to construct the stack of pages that represents your app state.
      ),
    );
  }
}
