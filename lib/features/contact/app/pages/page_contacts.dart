import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/features/profile/domain/view_profile.dart';

class PageProfile extends StatefulWidget {
  const PageProfile({Key? key}) : super(key: key);

  @override
  State<PageProfile> createState() => _PageProfileState();
}

class _PageProfileState extends State<PageProfile> {
  final StreamController<Profile> _profileStreamcontroller = StreamController();
  late Stream<Profile> _profileStream;
  late StreamSubscription _profileSubscription;
  late Profile profile;

  @override
  void initState() {
    super.initState();
    //initialize profile screen
    _profileStream = _profileStreamcontroller.stream;

    //initialize profile
    profile = Profile();

    //add profile to stream
    _profileStreamcontroller.sink.add(profile);

    //initializing a subscription on _profile stream
    _profileSubscription = _profileStream.listen((event) {});
  }

  @override
  void dispose() {
    _profileSubscription.cancel(); //Canceling subscription on a profile stream
    _profileStreamcontroller.close(); //closing profile stream
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Profile>(
        stream: _profileStream,
        builder: (context, AsyncSnapshot<Profile> snapshot) {
          return Container();
        });
  }
}
