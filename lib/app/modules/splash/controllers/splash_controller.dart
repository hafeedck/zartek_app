import 'package:get/get.dart';
import 'package:machine_test_zartek/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2), () async {
      Get.offAndToNamed(Routes.LOGIN);
    });

    super.onInit();
  }
}
