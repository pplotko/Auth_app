import 'package:auth_app/widgets/app_settings/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../numeric_keyboard/numeric_keyboard_widget.dart';
import '../pin_code_indicator/pin_code_indicator_widget.dart';
import 'package:auth_app/widgets/provider/auth_provider.dart';

class AuthenticationWidget extends StatefulWidget {
  const AuthenticationWidget({Key? key}) : super(key: key);

  @override
  State<AuthenticationWidget> createState() => _AuthenticationWidgetState();
}

class _AuthenticationWidgetState extends State<AuthenticationWidget> {
  @override
  Widget build(BuildContext context) {
    final screenMessage = AuthWidgetProvider.watch(context)?.loginPinScreenMessage ?? '-1';
    AuthWidgetProvider.read(context)?.mode = 'login';

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            // iconTheme: const IconThemeData(
            //   color: Colors.black, //change your color here
            // ),
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text('Login',
                  style: AppTextStyles.blackTextAppBar,
                ),
                Text('Use 4-digits PIN',
                  style: AppTextStyles.greyTextAppBar,
                ),
              ],
            ),
          ),
        body: Column(
          children: [
            const SizedBox(height: 60,),
            Center(
              child: Text(screenMessage,
                style: AppTextStyles.greyText,
              ),
            ),
            const SizedBox(height: 20,),
            const PinCodeIndicator(),
            const SizedBox(height: 5,),
            const NumericKeyboardWidget(),
            const SizedBox(height: 30,),
            ],
          ),
        )
    );
  }
}