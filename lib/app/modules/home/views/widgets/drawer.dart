import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test_zartek/app/config/assets_url.dart';
import 'package:machine_test_zartek/app/data/user_preference/user_prefrence_view_model.dart';
import 'package:machine_test_zartek/app/extension/widget_extension.dart';
import 'package:machine_test_zartek/app/helper/colors/app_color.dart';
import 'package:machine_test_zartek/app/helper/popup/logout_popup.dart';
import 'package:machine_test_zartek/app/helper/texts/text_widget.dart';
import 'package:machine_test_zartek/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrowerView extends StatelessWidget {
  const DrowerView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Drawer(
        backgroundColor: const Color(0xFFFFFFFF),
        child: Column(children: [
          Container(
            height: size.height * 0.3,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: AppColor.buttonGradient1,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                50.0.spaceY,
                ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Session.profilePictureUrl == ""
                        ? Image.asset(
                            AssetsUrl().profilePicture,
                            width: 80.0,
                            height: 80.0,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            Session.profilePictureUrl,
                            width: 80.0,
                            height: 80.0,
                            fit: BoxFit.cover,
                          )),
                10.0.spaceY,
                commonText(Session.userName, AppColor.blackColor, 18),
                10.0.spaceY,
                commonText("ID :${Session.userid}", AppColor.blackColor, 12)
              ],
            ),
          ),
          InkWell(
            onTap: () async {
              dynamic returnResponse = await openDialog(
                  'Logout', 'Are you sure you want to Logout ?');
              if (returnResponse == true) {
                final prefs = await SharedPreferences.getInstance();
                prefs.clear();
                await FirebaseAuth.instance.signOut();
                Session.userid = '';
                Get.offAllNamed(Routes.SPLASH);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.logout,
                  size: 30,
                  color: AppColor.greyDarkColor,
                ),
                commonText("Logout", AppColor.greyDarkColor, 20)
                    .paddingOnly(left: 40)
              ],
            ).paddingAll(15),
          )
        ]));
  }
}
