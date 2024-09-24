import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class TermAndConditionWidget extends StatelessWidget {
  final bool value;
  final Function(bool?) onChanged;
  const TermAndConditionWidget({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          activeColor: AppColors.deepGrey,
          onChanged: onChanged,
        ),
        const Text(
          AppStrings.iHaveAgreeToOur,
        ),
        const Expanded(
          child: Text(
            AppStrings.termsAndCondition,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
