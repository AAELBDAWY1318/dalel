import 'package:dalel/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyles{
  static final pacifico40064 = TextStyle(
    fontSize: 64.0, 
    fontWeight: FontWeight.w400, 
    color: AppColors.deepBrown, 
    fontFamily: "Pacifico", 
  );

  static const poppins50024 = TextStyle(
    fontSize: 24.0, 
    fontWeight: FontWeight.w600, 
    color: Colors.black, 
    fontFamily: "Poppins", 
  );

  static final poppins50016 = TextStyle(
    fontSize: 16.0, 
    fontWeight: FontWeight.w500, 
    color: AppColors.deepBrown, 
    fontFamily: "Poppins", 
  );
  static final poppins40022 = TextStyle(
    fontSize: 20.0, 
    fontWeight: FontWeight.w400, 
    color: AppColors.deepBrown, 
    fontFamily: "Poppins", 
  );
}

//Poppins