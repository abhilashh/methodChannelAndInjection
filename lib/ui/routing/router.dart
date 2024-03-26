
import 'package:auto_route/annotations.dart';
import 'package:auto_route/src/route/auto_route_config.dart';
import 'package:batterylevel/ui/routing/router.gr.dart';



@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter{
  @override
  // TODO: implement routes
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashPage.page),
    AutoRoute(page: LoginPage.page),
    AutoRoute(page: RegistrationPage.page),
    AutoRoute(page: MyQuotePage.page,initial: true),
    AutoRoute(page: CartPage.page),
    AutoRoute(page: HomePage.page),
  ];

}