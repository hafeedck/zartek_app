import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test_zartek/app/helper/colors/app_color.dart';
import 'package:machine_test_zartek/app/helper/texts/text_widget.dart';

class DrowerView extends StatelessWidget {
  const DrowerView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Drawer(
        backgroundColor: const Color(0xFFFFFFFF),
        child: Column(children: [
          Container(
            height: size.height * 0.3,
            decoration: const BoxDecoration(
                gradient: AppColor.buttonGradient1,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.logout,
                size: 30,
                color: AppColor.greyDarkColor,
              ),
              commonText("Logout", AppColor.greyDarkColor, 20)
                  .paddingOnly(left: 40)
            ],
          ).paddingAll(15)
        ]));
  }
}
