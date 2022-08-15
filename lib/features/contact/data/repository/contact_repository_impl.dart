import 'dart:async';
import 'dart:math';

import 'package:flutter_app/features/contact/data/sources/contact_local_source.dart';
import 'package:flutter_app/features/contact/domain/entities/contact.dart';
import 'package:flutter_app/features/contact/domain/repository/contact_repository.dart';
import 'package:flutter_app/features/contact/domain/usecases/create_contact.dart';
import 'package:flutter_app/features/contact/domain/usecases/find_contacts.dart';

class ContactRepositoryImpl extends ContactRepository {
  final ContactLocalSource contactLocalSource;
  ContactRepositoryImpl(this.contactLocalSource);

  //contact list
  final _currentContacts = <Contact>[];

  //contact controller
  final StreamController _contactsStreamController =
      StreamController<List<Contact>>();

  //contact stream
  Stream<List<Contact>>? _contactsStream;

  @override
  Future<void> init() {
    return Future.value();
  }

  @override
  Future<bool> createContact(CreateContactParams params) {
    Contact newContact =
        Contact(id: Random().nextInt(15).toString(), name: params.name);
    final result = contactLocalSource.cacheSingleContact(newContact);
    if (result) {
      _contactsStreamController.sink.add(contactLocalSource.getContacts());
      return Future.value(true);
    }
    return Future.value(false);
  }

  @override
  Future<List<Contact>> findContacts(FindContactsParams params) {
    return Future.value(_currentContacts);
  }

  @override
  Stream<List<Contact>> watchAllContacts() {
    _contactsStream ??=
        _contactsStreamController.stream as Stream<List<Contact>>;
    return _contactsStream!;
  }

  @override
  void close() {
    _contactsStreamController.close();
  }
}
