import 'package:flutter_app/features/profile/domain/view_profile.dart';

class ProfileState {}

//profile loading state
class ProfileLoading {}

//profile loaded
class ProfileLoaded {
  final Profile profile;
  const ProfileLoaded({
    required this.profile,
  });
}

//profile error
class ProfileError {
  final Error failure;
  const ProfileError({
    required this.failure,
  });
}
