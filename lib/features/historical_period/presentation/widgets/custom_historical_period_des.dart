import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomHistoricalPeriodDescription extends StatefulWidget {
  final String description, image;

  const CustomHistoricalPeriodDescription({
    Key? key,
    required this.description,
    required this.image,
  }) : super(key: key);

  @override
  CustomHistoricalPeriodDescriptionState createState() => CustomHistoricalPeriodDescriptionState();
}

class CustomHistoricalPeriodDescriptionState extends State<CustomHistoricalPeriodDescription> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isExpanded ? null : 190.0, // Expand height if isExpanded is true
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.description,
                  overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                  maxLines: isExpanded ? null : 6,
                  style: AppTextStyles.poppins50016.copyWith(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: Text(
                    isExpanded ? "Read less" : "Read more",
                    style: const TextStyle(color: Colors.black, fontSize: 14.0),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20.0),
          CachedNetworkImage(
            height: 190,
            width: 131,
            fit: BoxFit.contain,
            imageUrl: widget.image,
            placeholder: (context, url) => CircularProgressIndicator(color: AppColors.primaryColor),
            errorWidget: (context, url, error) => Icon(Icons.error, color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}
