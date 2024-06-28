import 'package:machine_test_zartek/app/model/user_model.dart';
import 'package:machine_test_zartek/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  Future<bool> saveUser(UserModel responseModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    sp.setString('enc_key', responseModel.encKey!);

    return true;
  }

  Future<UserModel?> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? enckey = sp.getString('enc_key');
    if (enckey != null) {
      String? username = sp.getString('username');
      String? name = sp.getString('name');
      String? type = sp.getString('type');
      String? enckey = sp.getString('enc_key');
      String? id = sp.getString('id');
      String? role = sp.getString('role');
      return UserModel(
          id: id,
          name: name,
          role: role,
          username: username,
          encKey: enckey,
          type: type);
    } else {
      return null;
    }
  }

  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }

  void goToSplash() async {
    Get.offAndToNamed(Routes.LOGIN);
  }

  // void goToSplas1h() async {
  //   Get.rootDelegate.offNamed(Routes.root);
  // }
}
