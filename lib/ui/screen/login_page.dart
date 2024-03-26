import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:batterylevel/ui/routing/router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            context.replaceRoute(RegistrationPage());
          },
          child: Text('press'),
        ),
      ),
    );
  }
}
