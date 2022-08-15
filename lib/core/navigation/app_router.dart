import 'package:flutter/material.dart';
import 'package:flutter_app/core/navigation/deep_link.dart';

class AppRouter extends RouterDelegate<AppLink> {
  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  Future<bool> popRoute() {
    // TODO: implement popRoute
    throw UnimplementedError();
  } 

  AppLink getCurrentPath() {
    return AppLink();
  }

  @override
  AppLink get currentConfiguration  => getCurrentPath();

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }

  //Here lies the logic that maps a specific URL path to a specific screen
  @override
  Future<void> setNewRoutePath(AppLink newLink) async {
    switch (newLink.location) {
      case AppLink.kHomePath:
        break;
      default:
        break;
    }
  }
}
