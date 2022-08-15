import 'package:flutter_app/core/helpers/usecase_helper.dart';
import 'package:flutter_app/features/profile/domain/view_profile.dart';

class ProfileManager {
  final ViewProfile viewProfile;
  const ProfileManager({
    required this.viewProfile,
  });

  Stream<Profile> watchProfile() {
    return viewProfile.call(NoParams());
  }
}
