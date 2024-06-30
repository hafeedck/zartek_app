import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test_zartek/app/extension/widget_extension.dart';
import 'package:machine_test_zartek/app/helper/colors/app_color.dart';
import 'package:machine_test_zartek/app/helper/common_widgets/buttons/common_button.dart';
import 'package:machine_test_zartek/app/helper/common_widgets/text_fields/otp_textfield.dart';
import 'package:machine_test_zartek/app/helper/texts/text_widget.dart';
import 'package:machine_test_zartek/app/modules/login/controllers/login_controller.dart';

class OtpView extends GetView<LoginController> {
  const OtpView({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          commonText("Enter Otp", AppColor.primaryColor, 30),
          50.0.spaceY,
          SizedBox(
            width: size.width * 0.84,
            child: OtpTextfield(
              oncomplete: (pin) {
                return null;
              },
              onchange: (pin) {
                controller.pinCodeNumber.value = pin;
                return null;
              },
            ),
          ),
          25.0.spaceY,
          SizedBox(
              height: size.height * 0.06,
              child: Obx(
                () => CommonButtonWidget(
                  label: "Submit",
                  isLoading: controller.isLoading.value,
                  onClick: () async {
                    controller.verifyOtp();
                  },
                ),
              )),
        ],
      ).paddingAll(15),
    );
  }
}
