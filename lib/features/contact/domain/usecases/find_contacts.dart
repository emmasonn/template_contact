import 'package:flutter_app/core/helpers/usecase_helper.dart';
import 'package:flutter_app/features/contact/domain/entities/contact.dart';
import 'package:flutter_app/features/contact/domain/repository/contact_repository.dart';

class FindContacts extends Usecase<FindContactsParams, List<Contact>> {
  final ContactRepository contactRepository;

  FindContacts(
    this.contactRepository,
  );

  @override
  Future<List<Contact>> call(FindContactsParams params) {
    return contactRepository.findContacts(params);
  }
}

class FindContactsParams {
  final String name;
  const FindContactsParams({
    required this.name,
  });
}
