import 'package:machine_test_zartek/app/helper/common_widgets/svg_icons/svg_widget.dart';
import 'package:machine_test_zartek/app/helper/texts/text_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PmHomeAppbar extends StatelessWidget implements PreferredSize {
  final String textLabel;
  final Function? onPressed;
  Function? notificationClick;
  PmHomeAppbar(
      {super.key,
      required this.textLabel,
      this.onPressed,
      this.notificationClick});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      title: commonText2(
        textLabel,
        Colors.black.withOpacity(0.8),
        18,
        FontWeight.w500,
      ),
      actions: [
        InkWell(
          onTap: () {
            notificationClick!();
          },
          child: svgWidget("assets/svg_icon/notification.svg",
              color: Colors.black.withOpacity(0.8)),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget get child => throw UnimplementedError();
}
