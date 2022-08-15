import 'package:flutter_app/features/contact/domain/entities/contact.dart';

abstract class ContactLocalSource {
  bool cacheAllContacts(List<Contact> contacts);
  bool cacheSingleContact(Contact contact);
  List<Contact> getContacts();
}

class ContactLocalSourceImpl extends ContactLocalSource {
  List<Contact> contacts = [];

  @override
  bool cacheSingleContact(Contact contact) {
    contacts.add(contact);
    return true;
  }

  @override
  bool cacheAllContacts(List<Contact> contacts) {
    contacts.addAll(contacts);
    return true;
  }

  @override
  List<Contact> getContacts() {
    return contacts;
  }
}
