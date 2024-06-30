import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test_zartek/app/config/assets_url.dart';
import 'package:machine_test_zartek/app/extension/widget_extension.dart';
import 'package:machine_test_zartek/app/helper/colors/app_color.dart';
import 'package:machine_test_zartek/app/helper/common_widgets/buttons/common_button.dart';
import 'package:machine_test_zartek/app/routes/app_pages.dart';
import 'package:machine_test_zartek/app/services/firebase_auth.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AssetsUrl().mainLogo,
              width: size.width * 0.5,
              height: size.height * 0.5,
            ),
            //
            const Spacer(),
            Center(
              child: SizedBox(
                width: size.width * 0.8,
                height: size.height * 0.08,
                child: CommonButtonWithIconWidget(
                  label: "Google",
                  onClick: () {
                    FireBaseAuthProvider().firebaseGoogleSignIn();
                  },
                  icon: AssetsUrl().googleIcon,
                  borderRadius: 30,
                  color: AppColor.googlebuttonColor,
                ),
              ),
            ),
            15.0.spaceY,

            Center(
              child: SizedBox(
                width: size.width * 0.8,
                height: size.height * 0.08,
                child: CommonButtonWithIconWidget(
                  label: "Phone",
                  onClick: () {
                    Get.toNamed(Routes.LOGIN_WITH_PHONE);
                  },
                  icon: AssetsUrl().phoneIcon,
                  gradient: AppColor.buttonGradient1,
                  borderRadius: 30,
                ),
              ),
            )
          ],
        ).paddingOnly(bottom: 150),
      ),
    );
  }
}
