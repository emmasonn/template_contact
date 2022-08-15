import '../view_profile.dart';

abstract class ProfileRepository {
  Stream<Profile> watchProfile();
}
