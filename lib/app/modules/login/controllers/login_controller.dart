import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test_zartek/app/routes/app_pages.dart';
import 'package:machine_test_zartek/app/services/firebase_auth.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  RxString verificationId = "".obs;
  RxString pinCodeNumber = "".obs;
  final formKey = GlobalKey<FormState>();
  TextEditingController mobileController = TextEditingController();
  sendOtp() async {
    isLoading(true);
    try {
      await FireBaseAuthProvider().firebasePhoneAuth(
        mobileController.text,
        (String value) {
          verificationId.value = value;
          Get.toNamed(Routes.OTP_VIEW);
        },
      );
    } finally {
      isLoading(false);
    }
  }

  verifyOtp() async {
    isLoading(true);
    try {
      await FireBaseAuthProvider().verifyingPhoneAuth(
        verificationId.value,
        pinCodeNumber.value,
      );
    } finally {
      isLoading(false);
    }
  }

  clear() {
    mobileController.clear();
  }
}
