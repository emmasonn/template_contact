import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/features/contact/app/provider/contact_manager.dart';
import 'package:flutter_app/features/contact/app/provider/contact_state.dart';
import 'package:flutter_app/features/profile/domain/view_profile.dart';
import 'package:flutter_app/main.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart' as pr;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/custom_search_delegate.dart';
import '../../../../core/widgets/custom_page.dart';

enum Menu { upload, share }

class PageContacts extends StatefulWidget {
  const PageContacts({
    Key? key,
    this.tab,
  }) : super(key: key);
  final int? tab;

  static Page page({LocalKey? key,  int? tab}) {
    return CustomPage<void>(
        key: key,
        animationStyle: PageAnimationStyle.none,
        child: PageContacts(
          tab: tab,
        ));
  }

  @override
  State<StatefulWidget> createState() => _PageContactsState();
}

class _PageContactsState extends State<PageContacts> {
  List<Widget> pages = [
    Container(
      child: const Icon(Icons.contact_mail),
    ),
    Container(
      child: const Icon(Icons.favorite),
    )
  ];

  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // final ContactManager contactManager =
    //     ref.watch(contactManagerProvider.notifier);
    //
    // ref.listen<ContactsState>(contactManagerProvider, (previous, next) {
    //   print('Called from ref listener');
    //   if (next is ContactsData) {}
    // });
    final contactManager =
        pr.Provider.of<ContactManager>(context, listen: false);

    return Material(
      child: DefaultTabController(
        length: 2,
        child: Tab(
          height: 50,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              title: Text(
                'Contacts',
                style: Theme.of(context).textTheme.headline6,
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    showSearch(
                      context: context,
                      delegate: CustomSearchDelegate(),
                    );
                  },
                  child: const Hero(
                    tag: 'search',
                    child: Icon(Icons.search),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                PopupMenuButton<Menu>(
                    child: const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.more_vert,
                      ),
                    ),
                    onSelected: (Menu item) {
                      if(item == Menu.upload) {
                        GoRouter.of(context).go('/home/$currentTab/add-contact');
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<Menu>>[
                          const PopupMenuItem<Menu>(
                            value: Menu.upload,
                            child: Text('Add contact'),
                          ),
                          const PopupMenuItem<Menu>(
                            value: Menu.share,
                            child: Text('Share'),
                          ),
                        ])
              ],
              bottom: TabBar(
                tabs: [
                  Text(
                    'All contacts',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    'Favorites',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
                onTap: contactManager.goToTab,
              ),
            ),
            body: pr.Consumer<ContactManager>(
              builder: (context, state, child) {
                currentTab = state.tab;

                return Container(
                    width: size.width,
                    height: size.height,
                    padding: const EdgeInsets.only(top: 15),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        )),
                    child: IndexedStack(
                      index: state.tab,
                      children: pages,
                    ));
              },
            ),
          ),
        ),
      ),
    );
  }
}
