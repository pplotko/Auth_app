import 'package:auth_app/widgets/app_settings/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'package:auth_app/widgets/app_settings/app_colors.dart';
import 'package:auth_app/widgets/numeric_keyboard/numeric_keyboard_widget.dart';
import 'package:auth_app/widgets/pin_code_indicator/pin_code_indicator_widget.dart';
import 'package:auth_app/widgets/provider/auth_provider.dart';


class SetupPinWidget extends StatefulWidget {
   const SetupPinWidget({Key? key}) : super(key: key);

  @override
  State<SetupPinWidget> createState() => _SetupPinWidgetState();
}

class _SetupPinWidgetState extends State<SetupPinWidget> {

  @override
  Widget build(BuildContext context) {
    final screenMessage = AuthWidgetProvider.watch(context)?.setupPinScreenMessage ?? '-1';
    AuthWidgetProvider.read(context)?.mode = 'setup';

    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.colorWhite,
          appBar: AppBar(
            // iconTheme: const IconThemeData(
            //   // color: AppColors.colorBlueGrey, //change your color here
            // ),
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text('Setup PIN',
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
