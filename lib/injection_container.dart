import 'package:flutter_app/features/contact/app/provider/contact_manager.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  //*contact manager
  sl.registerFactory(() => ContactManager());


}