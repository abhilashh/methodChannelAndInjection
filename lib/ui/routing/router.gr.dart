// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:batterylevel/ui/screen/birdList_page.dart' as _i1;
import 'package:batterylevel/ui/screen/cart_page.dart' as _i2;
import 'package:batterylevel/ui/screen/home.dart' as _i3;
import 'package:batterylevel/ui/screen/login_page.dart' as _i4;
import 'package:batterylevel/ui/screen/myQuote_page.dart' as _i5;
import 'package:batterylevel/ui/screen/registration_page.dart' as _i6;
import 'package:batterylevel/ui/screen/splash_page.dart' as _i7;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    BirdList.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.BirdList(),
      );
    },
    CartPage.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CartPage(),
      );
    },
    HomePage.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.HomePage(),
      );
    },
    LoginPage.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LoginPage(),
      );
    },
    MyQuotePage.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.MyQuotePage(),
      );
    },
    RegistrationPage.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.RegistrationPage(),
      );
    },
    SplashPage.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SplashPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.BirdList]
class BirdList extends _i8.PageRouteInfo<void> {
  const BirdList({List<_i8.PageRouteInfo>? children})
      : super(
          BirdList.name,
          initialChildren: children,
        );

  static const String name = 'BirdList';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CartPage]
class CartPage extends _i8.PageRouteInfo<void> {
  const CartPage({List<_i8.PageRouteInfo>? children})
      : super(
          CartPage.name,
          initialChildren: children,
        );

  static const String name = 'CartPage';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomePage extends _i8.PageRouteInfo<void> {
  const HomePage({List<_i8.PageRouteInfo>? children})
      : super(
          HomePage.name,
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginPage]
class LoginPage extends _i8.PageRouteInfo<void> {
  const LoginPage({List<_i8.PageRouteInfo>? children})
      : super(
          LoginPage.name,
          initialChildren: children,
        );

  static const String name = 'LoginPage';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.MyQuotePage]
class MyQuotePage extends _i8.PageRouteInfo<void> {
  const MyQuotePage({List<_i8.PageRouteInfo>? children})
      : super(
          MyQuotePage.name,
          initialChildren: children,
        );

  static const String name = 'MyQuotePage';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.RegistrationPage]
class RegistrationPage extends _i8.PageRouteInfo<void> {
  const RegistrationPage({List<_i8.PageRouteInfo>? children})
      : super(
          RegistrationPage.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationPage';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SplashPage]
class SplashPage extends _i8.PageRouteInfo<void> {
  const SplashPage({List<_i8.PageRouteInfo>? children})
      : super(
          SplashPage.name,
          initialChildren: children,
        );

  static const String name = 'SplashPage';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
