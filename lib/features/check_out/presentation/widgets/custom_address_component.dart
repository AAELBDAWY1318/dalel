import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomAddressComponent extends StatelessWidget {
  const CustomAddressComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 70.0,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 248, 207, 211),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.home,
                        color: AppColors.grey,
                      ),
                      Text(
                        "Home",
                        style: TextStyle(color: AppColors.grey),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Cairo, Egypt",
                  style: AppTextStyles.poppins50016.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Pangandaran Brick Street No. 690445434 Yogya, Central Java",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.font14,
                ),
              ],
            ),
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                "Change",
                style: AppTextStyles.font22,
              ))
        ],
      ),
    );
  }
}
