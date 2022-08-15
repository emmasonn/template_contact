class AppLink {
//Routers
  static const kHomePath = '/home';
  static const kItemPath = '/item';

//store tab param label;
  static String kTabParam = 'tab';
//store id param label;
  static String kIdParam = 'id';

//store the path of the url
  String? location;
  //store the currentTab
  int? currentTab;
  //store id on the url
  String? itemId;

  AppLink({
    this.location,
    this.currentTab,
    this.itemId,
  });

  static AppLink fromLocation(String? linkUrl) {
    linkUrl = Uri.decodeFull(linkUrl ?? '');
    final uri = Uri.parse(linkUrl);
    final params = uri.queryParameters;
    final currentTab = int.tryParse(params[AppLink.kTabParam] ?? '');
    final id = params[AppLink.kIdParam];
    final appLink = AppLink(
      location: uri.path,
      currentTab: currentTab,
      itemId: id,
    );
    return appLink;
  }

  String toLocation() {
    
    String addKeyValPair({
      required String key,
      String? value,
    }) =>
        value == null ? '' : '$key=$value&';

    switch (location) {
      case kHomePath:
        return kHomePath;
      case kItemPath:
        var loc = '$kItemPath?';
        loc += addKeyValPair(
          key: kIdParam,
          value: itemId,
        );
        return Uri.encodeFull(loc);
      default:
        var loc = '$kHomePath?';
        loc += addKeyValPair(key: kTabParam, value: currentTab.toString());
        return Uri.encodeFull(loc);
    }
  }
}
