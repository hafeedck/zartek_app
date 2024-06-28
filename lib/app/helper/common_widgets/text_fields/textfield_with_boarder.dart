import 'package:machine_test_zartek/app/helper/colors/app_color.dart';
import 'package:flutter/material.dart';

class CommonTextFieldWithBorder extends StatelessWidget {
  final String? hintText;
  final bool? isEnable;
  final FormFieldValidator? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? expands;
  final Function? onTap;
  final TextInputType? textInputType;
  final bool obscureText;
  final Function? suffixIconClick;
  final TextEditingController? textEditingController;
  final bool readonly;
  const CommonTextFieldWithBorder(
      {super.key,
      this.hintText,
      this.isEnable,
      this.readonly = false,
      this.validator,
      this.prefixIcon,
      this.textInputType,
      this.obscureText = false,
      this.expands = false,
      this.suffixIconClick,
      this.textEditingController,
      this.suffixIcon,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readonly,
      textAlign: TextAlign.start,
      validator: validator,
      obscureText: obscureText,
      controller: textEditingController,
      enabled: isEnable ?? true,
      style: const TextStyle(fontSize: 16),
      expands: expands!,
      maxLines: null,

      onTap: onTap == null
          ? null
          : () {
              FocusScope.of(context).requestFocus(FocusNode());
              onTap!();
            },
      // keyboardType: textInputType,
      // inputFormatters: <TextInputFormatter>[
      //   FilteringTextInputFormatter.allow(RegExp(r'^[0-9][0-9]*')),
      //   LengthLimitingTextInputFormatter(10),
      // ],
      decoration: InputDecoration(
        labelStyle: const TextStyle(
          color: AppColor.primaryColor,
          fontFamily: 'Manrope',
          fontSize: 14.0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
        ),
        labelText: hintText,
        fillColor: Colors.white,

        // contentPadding: EdgeInsets.symmetric(horizontal: 15),
        hintStyle: const TextStyle(
          color: AppColor.primaryColor,
          fontSize: 14,
          fontFamily: "Manrope",
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        isDense: true,

        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(8.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(8.0),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: suffixIcon,
        ),
        hintText: hintText,
      ),
    );
  }
}
