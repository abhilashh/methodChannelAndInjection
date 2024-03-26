

import 'package:batterylevel/service/injection/injection.config.dart';
import 'package:batterylevel/service/services/dioService.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';


final locator = GetIt.instance;

// @InjectableInit()
// Future<void> configureDependencies() async => await locator.init();

@InjectableInit()
Future<void> setUp() async {
  locator.init();
  locator.registerLazySingletonAsync<SharedPreferences>(() async => await SharedPreferences.getInstance());
  await locator.isReady<SharedPreferences>();

}






