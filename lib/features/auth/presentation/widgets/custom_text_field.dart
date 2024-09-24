import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final String label;
  final Widget? suffixIcon;
  final bool? obscureText;

  const CustomTextField(
      {super.key,
      this.validator,
      required this.label,
      this.obscureText,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, left: 8, right: 8),
      child: TextFormField(
        validator: validator,
        cursorColor: AppColors.deepGrey,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          suffixIconColor: AppColors.deepGrey,
          
          label: Text(label),
          labelStyle: AppTextStyles.poppins50024.copyWith(
            fontSize: 14.0,
            color: AppColors.deepGrey,
          ),
          border: getBorder(),
          enabledBorder: getBorder(),
          focusedBorder: getBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder getBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
    );
  }
}
