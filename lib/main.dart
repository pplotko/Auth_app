import 'package:auth_app/widgets/state_widget.dart';
import 'package:flutter/material.dart';

import 'package:auth_app/widgets/menu_screen/menu_screen_widget.dart';
import 'package:auth_app/widgets/authentication_screen/authentication_widget.dart';
import 'package:auth_app/widgets/setup_pin_screen/setup_pin_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)  => StateWidget (
    child: MaterialApp(
      title: 'Auth_app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       primarySwatch: Colors.grey,
       appBarTheme: const AppBarTheme(
         backgroundColor: Colors.white,
         elevation: 0, // This removes the shadow from all App Bars.
         centerTitle: true,
        ),
      ),
    routes: {
      '/': (context) => const MenuScreenWidget(),
      '/setup_pin': (context) => SetupPINWidget(),
      '/authentication': (context) => AuthenticationWidget(),
    },
      initialRoute: '/',
    ),
  );
}

