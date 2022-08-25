import 'package:flutter/material.dart';
import 'package:flutter_app/core/navigation/tab_manager.dart';

class ContactManager extends ChangeNotifier {
  int _currentTab = TabManager.contacts;

  int get tab => _currentTab;

  ContactManager();

  void goToTab(int index) {
    _currentTab = index;
    notifyListeners();
  }
}
