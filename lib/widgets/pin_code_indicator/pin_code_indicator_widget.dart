import 'package:flutter/material.dart';

import 'package:auth_app/widgets/pin_code_indicator/indicator_cell.dart';
import 'package:auth_app/widgets/provider/auth_provider.dart';

class PinCodeIndicator extends StatelessWidget {
  const PinCodeIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final String? text = AuthWidgetProvider.watch(context)?.text;
    final int? text = AuthWidgetProvider.watch(context)?.index;
    final int pinLength;

    // text != null ? pinLength = text.length : pinLength = 0;
    pinLength = text!;
    print('pinLength for indicator = $pinLength');

    return
      Container(
        width: 200,
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IndicatorCellWidget(isFill: pinLength >= 1),
            IndicatorCellWidget(isFill: pinLength >= 2),
            IndicatorCellWidget(isFill: pinLength >= 3),
            IndicatorCellWidget(isFill: pinLength >= 4),
          ],
        ),
      );
  }
}