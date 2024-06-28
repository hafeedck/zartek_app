import 'package:machine_test_zartek/app/helper/colors/app_color.dart';
import 'package:machine_test_zartek/app/helper/common_widgets/svg_icons/svg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

class PmAssignButtonWidget extends StatelessWidget {
  final String label;
  final String addedby;
  final Color? color;
  final Color? fontcolor;
  final double? fontSize;
  final double? borderRadius;
  final VoidCallback? onClick;
  final bool? isLoading;
  final String? icon;
  final VoidCallback? onClose;
  const PmAssignButtonWidget({
    super.key,
    required this.label,
    this.onClick,
    this.fontSize,
    this.fontcolor,
    this.isLoading,
    this.borderRadius = 5,
    this.color,
    this.icon,
    required this.addedby,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: onClick == null
                ? null
                : () {
                    onClick!();
                  },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius!),
                  color: color ?? AppColor.primaryColor),
              child: isLoading == true
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (icon != null)
                              svgWidget(icon!, color: fontcolor, size: 15),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              label,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: fontcolor ?? Colors.white,
                                fontSize: fontSize,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        if (onClose != null)
                          InkWell(
                            onTap: onClose == null
                                ? null
                                : () {
                                    onClose!();
                                  },
                            child: Icon(
                              Icons.close,
                              color: fontcolor,
                              size: 14,
                            ).paddingOnly(left: 5),
                          )
                      ],
                    ).paddingAll(6),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              svgWidget("assets/svg_icon/people.svg", color: Colors.black)
                  .paddingOnly(top: 5, left: 1),
              const SizedBox(
                width: 3,
              ),
              Text(
                addedby,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColor.blackColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
