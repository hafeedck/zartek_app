import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:machine_test_zartek/app/helper/colors/app_color.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message, {bool isFaild = false}) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: isFaild ? AppColor.redColor : AppColor.blackColor,
      textColor: AppColor.whiteColor,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static toastMessageCenter(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColor.blackColor,
      gravity: ToastGravity.CENTER,
      toastLength: Toast.LENGTH_LONG,
      textColor: AppColor.whiteColor,
    );
  }

  static snackBar(
    String title,
    String message,
  ) {
    Get.snackbar(title, message,
        backgroundColor: AppColor.redColor,
        snackPosition: SnackPosition.TOP,
        maxWidth: GetPlatform.isDesktop ? Get.width * .5 : null,
        colorText: AppColor.whiteColor);
  }
}

String capitalize(String s) {
  if (s.isEmpty) return s;
  return s[0].toUpperCase() + s.substring(1);
}
