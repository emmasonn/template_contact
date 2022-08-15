import 'package:flutter_app/features/contact/domain/entities/contact.dart';
import 'package:flutter_app/features/contact/domain/usecases/create_contact.dart';
import 'package:flutter_app/features/contact/domain/usecases/find_contacts.dart';

abstract class ContactRepository {
  Future<void> init();
  void close();
  Stream<List<Contact>> watchAllContacts();
  Future<List<Contact>> findContacts(FindContactsParams params);
  Future<bool> createContact(CreateContactParams params);
}
