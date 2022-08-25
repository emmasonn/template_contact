import 'package:flutter/cupertino.dart';
import 'package:flutter_app/features/contact/app/pages/page_add_contact.dart';
import 'package:flutter_app/features/contact/app/pages/page_contact_detail.dart';
import 'package:flutter_app/features/contact/app/pages/page_contacts.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart' as pr;
import 'package:go_router/go_router.dart';

import '../../features/contact/app/provider/contact_manager.dart';

class AppRoutes {

  static final home = GoRoute(
    path: '/',
    redirect: (_) => '/home/0',
  );

  static final homeTab = GoRoute(
      path: '/home/:tid',
      pageBuilder: (BuildContext context, GoRouterState state) {
        // final contactManager =
        //     pr.Provider.of<ContactManager>(context, listen: false);
        final String tid = state.params['tid'] ?? '1';
        return PageContacts.page(key: state.pageKey, tab: int.parse(tid));
      },
      routes: [
        addContact,
        details,
      ]);

  static final details = GoRoute(
    path: ':id',
    name: 'details',
    pageBuilder: (BuildContext context, GoRouterState state) {
      //return CustomRoute(child: PageContacts.page(key: state.pageKey));
      //here we retry our id from
      return PageContactDetail.page(key: state.pageKey);
    },
  );

  static final addContact = GoRoute(
      path: 'add-contact',
      name: 'addContact',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return PageAddContact.page(key: state.pageKey);
      });
}
