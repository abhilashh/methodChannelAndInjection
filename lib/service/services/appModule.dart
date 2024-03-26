
import 'package:batterylevel/ui/routing/router.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule{

  @injectable
  AppRouter get appRouter => AppRouter();

}