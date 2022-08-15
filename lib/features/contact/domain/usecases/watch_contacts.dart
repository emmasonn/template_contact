import 'package:flutter_app/core/helpers/usecase_helper.dart';
import 'package:flutter_app/features/contact/domain/entities/contact.dart';
import 'package:flutter_app/features/contact/domain/repository/contact_repository.dart';

class GetContacts extends StreamUsecase<NoParams, List<Contact>> {
  final ContactRepository contactRepository;
  GetContacts(this.contactRepository);

  @override
  Stream<List<Contact>> call(NoParams params) {
    return contactRepository.watchAllContacts();
  }
}
