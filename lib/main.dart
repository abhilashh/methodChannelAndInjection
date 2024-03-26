import 'package:batterylevel/service/injection/injection.dart';
import 'package:batterylevel/ui/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/provider/cart.dart';




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return ChangeNotifierProvider<Cart>(
      create:(context) => Cart(),
      child: MaterialApp.router(
        routerConfig: appRouter.config(),
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
