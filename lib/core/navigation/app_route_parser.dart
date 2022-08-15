import 'package:flutter/material.dart';
import 'package:flutter_app/core/navigation/deep_link.dart';

class AppRouteParser extends RouteInformationParser<AppLink> {
  @override
  Future<AppLink> parseRouteInformation(
      RouteInformation routeInformation) async {
    final appLink = AppLink.fromLocation(routeInformation.location);
    return appLink;
  }

  @override
  RouteInformation restoreRouteInformation(AppLink configuration) {
    final link = configuration.toLocation();
    return RouteInformation(location: link);
  }
}
