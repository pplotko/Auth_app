import 'package:auth_app/widgets/app_settings/app_colors.dart';
import 'package:flutter/material.dart';

class IndicatorCellWidget extends StatelessWidget {
  const IndicatorCellWidget({Key? key, required this.isFill}) : super(key: key);
  final bool isFill;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: AppColors.colorBlueGrey,
        ),
        color: isFill ? AppColors.colorPurple : AppColors.colorWhite,
        borderRadius: BorderRadius.circular(6.0),
      ),
    );
  }
}
