import 'package:get/get.dart';
import 'package:machine_test_zartek/app/helper/texts/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:machine_test_zartek/app/routes/app_pages.dart';

// ignore: must_be_immutable
class HomeAppBar extends StatelessWidget implements PreferredSize {
  final String textLabel;
  final Function? onPressed;
  final bool? visible;
  Function? onpress;
  HomeAppBar(
      {super.key, required this.textLabel, this.onPressed, this.onpress, this.visible});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: InkWell(
          onTap: () {
            onPressed!();
          },
          child: Icon(
            Icons.menu,
            color: Colors.black.withOpacity(0.8),
          ),
        ),
        title: commonText2(
            textLabel, Colors.black.withOpacity(0.8), 18, FontWeight.w500),
        actions: [
          Visibility(
            visible:visible! ,
            child: InkWell(
              onTap: () {
                Get.toNamed(Routes.CART);
              },
              child: const Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.black,
              ),
            ).paddingOnly(right: 10),
          ),
        ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget get child => throw UnimplementedError();
}
