import 'package:flutter/cupertino.dart';
import 'package:flutter_app/core/navigation/app_routes.dart';
import 'package:flutter_app/features/contact/app/pages/page_contacts.dart';
import 'package:provider/provider.dart' as pr;
import 'package:go_router/go_router.dart';

import '../../features/contact/app/provider/contact_manager.dart';
import '../../injection_container.dart';


final goRouter = GoRouter(
    initialLocation: AppRoutes.home.path,
    urlPathStrategy: UrlPathStrategy.path,
    refreshListenable: sl<ContactManager>(),
    routes: [
      AppRoutes.home,
      AppRoutes.homeTab,
    ],
    //this redirect is executed
    //1.when notifylistener is called on ContactManager
    //2.When we call context.goNamed or go
    redirect: (GoRouterState state) {
      return null;
    },
    errorPageBuilder: (BuildContext context, GoRouterState state) {
      print(state.error);
      final contactManager = pr.Provider.of<ContactManager>(context, listen: false);
      return PageContacts.page(key: state.pageKey, tab: contactManager.tab );
    });

