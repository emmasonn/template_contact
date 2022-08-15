import 'dart:async';

import 'package:flutter_app/features/profile/domain/repository/profile_repository.dart';
import 'package:flutter_app/features/profile/domain/view_profile.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  Stream<Profile>? profileStream;
  StreamController profileStreamController = StreamController<Profile>();

  @override
  Stream<Profile> watchProfile() {
    profileStream ??= profileStreamController.stream as Stream<Profile>;
    return profileStream!;
  }

  
}
