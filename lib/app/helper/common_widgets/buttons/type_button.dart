import 'package:machine_test_zartek/app/helper/colors/app_color.dart';
import 'package:machine_test_zartek/app/helper/texts/text_widget.dart';
import 'package:machine_test_zartek/app/helper/utils/utils.dart';
import 'package:flutter/material.dart';

Widget orderButtonFunction(String type) {
  switch (type) {
    case "production":
      return statusButtonWidget(
        capitalize(type),
        AppColor.primaryColor.withOpacity(0.1),
        AppColor.primaryColor,
      );

    case "packing":
      return statusButtonWidget(
        capitalize(type),
        const Color(0xffF4485D).withOpacity(0.1),
        const Color(0xffF4485D),
      );

    default:
      return const SizedBox();
  }
}

Container statusButtonWidget(
  String type,
  Color color,
  Color textColor,
) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Center(child: boldText(type, color: textColor)),
  );
}
