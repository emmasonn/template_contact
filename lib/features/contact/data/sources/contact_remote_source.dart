import 'package:flutter_app/features/contact/domain/entities/contact.dart';

abstract class ContactRemoteSource {
  Future<Contact> getContacts();
}

class ContactRemoteSourceImpl extends ContactRemoteSource {
  
  @override
  Future<Contact> getContacts() {
    // TODO: implement getContacts
    throw UnimplementedError();
  }

}