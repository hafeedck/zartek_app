import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// ignore: must_be_immutable
class OtpTextfield extends StatelessWidget {
  FormFieldValidator oncomplete;
  FormFieldValidator onchange;
  OtpTextfield({super.key, required this.oncomplete, required this.onchange});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: PinCodeTextField(
        autoFocus: true,
        appContext: context,
        length: 6,
        animationType: AnimationType.fade,
        textStyle:
            TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black),
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(12),
          fieldHeight: 60,
          fieldWidth: 50,
          borderWidth: 2,
          activeColor: const Color(0xFFCACACA),
          selectedColor: const Color(0xFFCACACA),
          activeFillColor: const Color(0xFFCACACA),
          disabledColor: const Color(0xFFCACACA),
          errorBorderColor: const Color(0xFFCACACA),
          inactiveColor: const Color(0xFFCACACA),
          inactiveFillColor: const Color(0xFFCACACA),
          selectedFillColor: const Color(0xFFCACACA),
        ),
        animationDuration: const Duration(milliseconds: 300),
        keyboardType: TextInputType.number,
        cursorColor: Get.isDarkMode ? Colors.white : Colors.black,
        onCompleted: oncomplete,
        onChanged: onchange,
        beforeTextPaste: (text) {
          return true;
        },
      ),
    );
  }
}
