import 'package:flutter/material.dart';

import 'package:auth_app/widgets/provider/auth_model.dart';
import 'package:auth_app/widgets/provider/auth_provider.dart';
import 'package:auth_app/widgets/app_settings/app_colors.dart';
import 'package:auth_app/widgets/authentication_screen/authentication_widget.dart';
import 'package:auth_app/widgets/menu_screen/menu_screen_widget.dart';
import 'package:auth_app/widgets/setup_pin_screen/setup_pin_widget.dart';
import 'package:auth_app/widgets/state_widget.dart';
import 'package:auth_app/widgets/welcome_page_screen/welcome_page_widget.dart';

class ApplicationWidget extends StatefulWidget {
  const ApplicationWidget({Key? key}) : super(key: key);

  @override
  State<ApplicationWidget> createState() => _ApplicationWidgetState();
}

class _ApplicationWidgetState extends State<ApplicationWidget> {
  final _model = AuthWidgetModel();

  @override
  Widget build(BuildContext context) => StateWidget (
    child: AuthWidgetProvider(
      model: _model,
      child: MaterialApp(
        title: 'Auth_app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.colorWhite,
            elevation: 0, // This removes the shadow from all App Bars.
            centerTitle: true,
          ),
        ),
        routes: {
          '/': (context) => const MenuScreenWidget(),
          '/setup_pin': (context) => const SetupPinWidget(),
          '/authentication': (context) => const AuthenticationWidget(),
          '/welcome_page': (context) => const WelcomwPageWidget(),
        },
        initialRoute: '/',
      ),
    ),
  );
}