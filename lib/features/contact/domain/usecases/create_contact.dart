import 'package:flutter_app/core/helpers/usecase_helper.dart';
import 'package:flutter_app/features/contact/domain/repository/contact_repository.dart';

class CreateContact extends Usecase<CreateContactParams, bool> {
  final ContactRepository contactRepository;
  CreateContact(this.contactRepository);
  @override
  Future<bool> call(CreateContactParams params) {
    return contactRepository.createContact(params);
  }
}

class CreateContactParams {
  final String name;
  CreateContactParams({
    required this.name,
  });
}
