import 'package:flutter_app/core/helpers/usecase_helper.dart';
import 'package:flutter_app/features/profile/domain/repository/profile_repository.dart';

class ViewProfile extends StreamUsecase<NoParams, Profile> {
  final ProfileRepository repository;
  ViewProfile(this.repository);

  @override
  Stream<Profile> call(NoParams params) {
    return repository.watchProfile();
  }
}

class Profile {}
