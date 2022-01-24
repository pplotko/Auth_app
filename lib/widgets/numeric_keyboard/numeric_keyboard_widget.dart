import 'package:auth_app/widgets/numeric_keyboard/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumericKeyboardWidget extends StatelessWidget {
  const NumericKeyboardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: GridView.count(
          crossAxisSpacing: 40,
          mainAxisSpacing: 0,
          crossAxisCount: 3,
          children: List.generate(12, (index) {
            String outputValue = '';
            if (index == 10) {outputValue = '0';
            } else {
              if (index == 11) {outputValue = '<';
              } else {
                outputValue = (index + 1).toString();
              }
            }
            if (outputValue != '10') {
              return CustomButton(outputValue: outputValue,);
            } else {
              return Container();
            }
          }),
        ),
      ),
    );
  }
}


