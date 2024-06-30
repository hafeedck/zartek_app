import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test_zartek/app/extension/widget_extension.dart';
import 'package:machine_test_zartek/app/helper/colors/app_color.dart';
import 'package:machine_test_zartek/app/helper/texts/text_widget.dart';
import 'package:machine_test_zartek/app/modules/home/views/widgets/cart_button.dart';

class CartItemCard extends StatelessWidget {
  final Function onTap;
  final String name;
  final String rate;
  final Color color;
  final String calories;
  final String totalrate;
  final String itemId;
  final Function onTapAdd;
  final Function onTapMinus;
  const CartItemCard({
    super.key,
    required this.onTap,
    required this.name,
    required this.rate,
    required this.calories,
    required this.color,
    required this.totalrate,
    required this.itemId,
    required this.onTapAdd,
    required this.onTapMinus,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.greyDarkColor)),
                child: Center(
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60), color: color),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.3,
                    child: commonText2(
                        name, AppColor.primaryTextColor, 16, FontWeight.bold),
                  ),
                  commonText2("INR $rate", AppColor.primaryTextColor, 13,
                      FontWeight.w500),
                  100.0.spaceX,
                  commonText2("$calories calories", AppColor.primaryTextColor,
                      13, FontWeight.w500),
                ],
              ).paddingOnly(left: 10),
              CategoryCardWidget(
                itemId: itemId,
                color: AppColor.darkGreenColor,
                onTapAdd: () {
                  onTapAdd();
                },
                onTapMinus: () {
                  onTapMinus();
                },
              ),
              commonText2("INR $totalrate", AppColor.primaryTextColor, 13,
                      FontWeight.w500)
                  .paddingOnly(left: 10),
            ],
          ).paddingOnly(left: 8, right: 8).paddingAll(5),
          const Divider(
            thickness: 1,
          )
        ],
      ),
    );
  }
}
