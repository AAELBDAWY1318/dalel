import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel/core/models/cart_model.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomCartItem extends StatefulWidget {
  final CartModel cartModel;

  /// Callback to pass updated values back to the parent widget.
  final Future<void> Function(
      bool isChecked, double paymentPerItem, String productId)? onItemUpdated;
  const CustomCartItem(
      {super.key, required this.cartModel, this.onItemUpdated});

  @override
  State<CustomCartItem> createState() => _CustomCartItemState();
}

class _CustomCartItemState extends State<CustomCartItem> {
  int count = 1;
  bool checkValue = false;

  Future<void> _updatePerant() async {
    if (widget.onItemUpdated != null) {
      double payment = count * double.parse(widget.cartModel.price);
      await widget.onItemUpdated!(checkValue, payment, widget.cartModel.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Checkbox(
            value: checkValue,
            onChanged: (val) async {
              setState(() {
                checkValue = val!;
              });
              await _updatePerant();
            },
            activeColor: AppColors.grey,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          width: MediaQuery.sizeOf(context).width * 0.85,
          height: 100.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            children: [
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: CachedNetworkImage(
                  imageUrl:
                      widget.cartModel.image,
                  placeholder: (context, url) =>
                      CircularProgressIndicator(color: AppColors.primaryColor),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error, color: AppColors.primaryColor),
                  height: 90,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      widget.cartModel.title,
                      style:
                          AppTextStyles.pacifico40064.copyWith(fontSize: 18.0),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "${widget.cartModel.price} \$",
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            if (count > 1) {
                              count--;
                            }
                          });
                          await _updatePerant();
                        },
                        child: CircleAvatar(
                          backgroundColor: AppColors.offWhite,
                          radius: 12.0,
                          child: const Icon(
                            Icons.remove,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Text(
                        "   $count   ",
                      ),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            count++;
                          });
                          await _updatePerant();
                        },
                        child: CircleAvatar(
                          backgroundColor: AppColors.grey,
                          radius: 12.0,
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
