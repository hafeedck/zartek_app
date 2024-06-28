import 'package:machine_test_zartek/app/helper/colors/app_color.dart';
import 'package:machine_test_zartek/app/helper/texts/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> openDialog(
  String title,
  String subTitle,
) {
  return Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        titlePadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                  // size: 20,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: commonText2(title, Colors.black, 20, FontWeight.w600),
            ),
          ],
        ),
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: commonText2(subTitle, Colors.black, 17, FontWeight.w500),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: const BorderSide(color: Colors.grey)))),
                      onPressed: () {
                        Get.back(result: false);
                      },
                      child: commonText2(
                          "Cancel", Colors.black, 17, FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    side: const BorderSide(
                                        color: AppColor.primaryColor)))),
                        onPressed: () {
                          Get.back(result: true);
                        },
                        child: const Text(
                          'Ok',
                          style: TextStyle(
                              fontFamily: "Manrope",
                              color: AppColor.primaryColor,
                              fontSize: 17),
                        )),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      barrierDismissible: false);
}
