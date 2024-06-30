import 'package:fluttertoast/fluttertoast.dart';
import 'package:machine_test_zartek/app/helper/colors/app_color.dart';

class Utils {
  static toastMessage(String message, {bool isFaild = false}) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: isFaild ? AppColor.redColor : AppColor.blackColor,
      textColor: AppColor.whiteColor,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
    );
  }
}
