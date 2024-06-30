import 'package:get/get.dart';
import 'package:machine_test_zartek/app/helper/texts/text_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommonAppBar extends StatelessWidget implements PreferredSize {
  final String textLabel;
  final Function? onPressed;
  final bool? visible;
  Function? onpress;
  CommonAppBar(
      {super.key,
      required this.textLabel,
      this.onPressed,
      this.onpress,
      this.visible});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: InkWell(
        onTap: () {
          Get.back();
        },
        child: Icon(
          Icons.arrow_back,
          color: Colors.black.withOpacity(0.8),
        ),
      ),
      title: commonText2(
          textLabel, Colors.black.withOpacity(0.8), 18, FontWeight.w500),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget get child => throw UnimplementedError();
}
