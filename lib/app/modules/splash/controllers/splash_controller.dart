import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:machine_test_zartek/app/data/user_preference/user_prefrence_view_model.dart';
import 'package:machine_test_zartek/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 1), () async {
      checkLoginStatus();
    });

    super.onInit();
  }
}

void checkLoginStatus() async {
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    Session.userid = user.uid;
    Session.userName = user.displayName ?? "";
    Session.profilePictureUrl = user.photoURL ?? "";
    Get.offAndToNamed(Routes.HOME);
  } else {
    Get.offAndToNamed(Routes.LOGIN);
  }
}
