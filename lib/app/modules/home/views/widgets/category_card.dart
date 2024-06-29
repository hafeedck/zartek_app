import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test_zartek/app/extension/widget_extension.dart';
import 'package:machine_test_zartek/app/helper/colors/app_color.dart';
import 'package:machine_test_zartek/app/helper/texts/text_widget.dart';
import 'package:machine_test_zartek/app/modules/home/views/widgets/cart_button.dart';

class CategoryItemCard extends StatelessWidget {
  final Function onTap;
  final String name;
  final String rate;
  final Color color;
  final String calories;
  final String customization;
  final String description;
  final String imagePath;
  final String itemId;
  final Function onTapAdd;
  final Function onTapMinus;
  const CategoryItemCard({
    super.key,
    required this.onTap,
    required this.name,
    required this.rate,
    required this.calories,
    required this.customization,
    required this.description,
    required this.imagePath,
    required this.color,
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: size.width * 0.6,
                          child: commonText2(name, AppColor.primaryTextColor,
                              15, FontWeight.w500),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            commonText2(rate, AppColor.primaryTextColor, 13,
                                FontWeight.w500),
                            100.0.spaceX,
                            commonText2(calories, AppColor.primaryTextColor, 13,
                                FontWeight.w500),
                          ],
                        ),
                        SizedBox(
                          width: size.width * 0.7,
                          child: commonText2(description,
                              AppColor.primaryTextColor, 12, FontWeight.w400),
                        ),
                        15.0.spaceY,
                        // Container(
                        //   height: 35,
                        //   width: 120,
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(30),
                        //       color: AppColor.phonebuttonColor),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     children: [
                        //       const Icon(
                        //         Icons.minimize,
                        //         color: Colors.white,
                        //         size: 20,
                        //       ).paddingOnly(bottom: 10),
                        //       commonText2("12", AppColor.whiteColor, 14,
                        //           FontWeight.w500),
                        //       const Icon(
                        //         Icons.add,
                        //         color: Colors.white,
                        //         size: 20,
                        //       ).paddingOnly(top: 3)
                        //     ],
                        //   ).paddingOnly(left: 10, right: 10),
                        // ),
                        CategoryCardWidget(
                          itemId: itemId,
                          onTapAdd: () {
                            onTapAdd();
                          },
                          onTapMinus: () {
                            onTapMinus();
                          },
                        ),
                        15.0.spaceY,
                        commonText2(
                            customization != ""
                                ? "Customization Aavailable"
                                : "",
                            AppColor.redColor,
                            12,
                            FontWeight.w400),
                      ],
                    ),
                  ]).paddingOnly(left: 10),
              Image.network(
                imagePath,
                height: 50,
                width: 50,
              )
            ],
          ).paddingOnly(left: 8, right: 8).paddingAll(5),
          const Divider(
            thickness: 1,
            color: AppColor.dividerColor,
          ),
        ],
      ),
    );
  }
}
