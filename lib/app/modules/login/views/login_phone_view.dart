import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test_zartek/app/extension/widget_extension.dart';
import 'package:machine_test_zartek/app/helper/colors/app_color.dart';
import 'package:machine_test_zartek/app/helper/common_widgets/buttons/common_button.dart';
import 'package:machine_test_zartek/app/helper/common_widgets/text_fields/login_textfield.dart';
import 'package:machine_test_zartek/app/helper/texts/text_widget.dart';
import '../controllers/login_controller.dart';

class LoginWithPhoneView extends GetView<LoginController> {
  const LoginWithPhoneView({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              commonText("Login", AppColor.primaryColor, 30),
              50.0.spaceY,
              LoginTextField(
                hintText: "Enter Your Mobile Number",
                keytype: TextInputType.phone,
                inputFormatters: true,
                textEditingController: controller.mobileController,
                prefixIcon: commonText("+91", AppColor.blackColor, 17)
                    .paddingOnly(top: 14, left: 10),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter Phone Number';
                  } else if (value.toString().length != 10) {
                    return 'Invalid Phone Number';
                  }
                  if (value.toString().substring(0, 1) == '0') {
                    return 'First Digit Should not be Zero';
                  }
                  return null;
                },
              ),
              25.0.spaceY,
              SizedBox(
                  height: size.height * 0.06,
                  child: Obx(
                    () => CommonButtonWidget(
                      label: "Request to OTP",
                      isLoading: controller.isLoading.value,
                      onClick: () async {
                        FocusScope.of(context).unfocus();
                        if (controller.formKey.currentState!.validate()) {
                          controller.sendOtp();
                        }
                      },
                    ),
                  )),
            ],
          ),
        ).paddingAll(15),
      ),
    );
  }
}
