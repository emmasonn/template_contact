import 'package:equatable/equatable.dart';
import 'package:flutter_app/features/contact/domain/entities/contact.dart';

class ContactsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ContactsInitial extends ContactsState {}

class ContactsData extends ContactsState {
  final List<Contact>? contacts;
  final int? tab;

  ContactsData({this.contacts, this.tab});
}
