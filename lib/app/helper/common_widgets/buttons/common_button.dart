import 'package:machine_test_zartek/app/extension/widget_extension.dart';
import 'package:machine_test_zartek/app/helper/colors/app_color.dart';
import 'package:machine_test_zartek/app/helper/common_widgets/svg_icons/svg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test_zartek/app/helper/texts/text_widget.dart';

class CommonButtonWidget extends StatelessWidget {
  final String label;
  final Color? color;
  final double? fontSize;
  final double? borderRadius;
  final VoidCallback onClick;
  final bool? isLoading;

  const CommonButtonWidget(
      {super.key,
      required this.label,
      required this.onClick,
      this.fontSize,
      this.isLoading,
      this.borderRadius = 25,
      this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height * .07,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius!),
            color: color ?? AppColor.primaryColor),
        child: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Center(
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CommonButtonWithIconWidget extends StatelessWidget {
  final String label;
  final Color? color;
  final Color? fontcolor;
  final double? fontSize;
  final double? borderRadius;
  final VoidCallback? onClick;
  final bool? isLoading;
  Gradient? gradient;
  final String? icon;
  final VoidCallback? onClose;
  CommonButtonWithIconWidget({
    super.key,
    required this.label,
    this.onClick,
    this.fontSize,
    this.fontcolor,
    this.isLoading,
    this.borderRadius = 5,
    this.color,
    this.gradient,
    this.icon,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: InkWell(
        onTap: onClick == null
            ? null
            : () {
                onClick!();
              },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius!),
            color: gradient == null ? color ?? AppColor.primaryColor : null,
            gradient: gradient,
          ),
          child: isLoading == true
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    20.0.spaceX,
                    if (icon != null)
                      svgWidget(icon!, color: fontcolor, size: 18),
                    75.0.spaceX,
                    commonText(label, fontcolor ?? Colors.white, 15),
                  ],
                ).paddingAll(6),
        ),
      ),
    );
  }
}
