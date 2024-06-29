import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test_zartek/app/helper/colors/app_color.dart';
import 'package:machine_test_zartek/app/helper/texts/text_widget.dart';
import 'package:machine_test_zartek/app/modules/cart/controllers/cart_controller.dart';

class CategoryCardWidget extends StatefulWidget {
  final String? itemId;
  final Function onTapAdd;
  final Function onTapMinus;
  const CategoryCardWidget({
    super.key,
    this.itemId,
    required this.onTapAdd,
    required this.onTapMinus,
  });

  @override
  State<CategoryCardWidget> createState() => _CategoryCardWidgetState();
}

class _CategoryCardWidgetState extends State<CategoryCardWidget> {
  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();
    final isItem = cartController.cartList
        .indexWhere((element) => element.dishId == widget.itemId.toString());

    return Container(
      height: 35,
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColor.phonebuttonColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                widget.onTapMinus();
                // cartController.cartList[isItem].qty =
                //     cartController.cartList[isItem].qty++;
              });
            },
            child: const Icon(
              Icons.minimize,
              color: Colors.white,
              size: 20,
            ).paddingOnly(bottom: 10),
          ),
          if (isItem >= 0)
            commonText2(cartController.cartList[isItem].qty.toString(),
                AppColor.whiteColor, 14, FontWeight.w500),
          if (isItem < 0)
            commonText2(
                "0".toString(), AppColor.whiteColor, 14, FontWeight.w500),
          InkWell(
            onTap: () {
              setState(() {
                widget.onTapAdd();
                // cartController.cartList[isItem].qty =
                //     cartController.cartList[isItem].qty++;
              });
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 20,
            ).paddingOnly(top: 3),
          )
        ],
      ).paddingOnly(left: 10, right: 10),
    );
  }
}
