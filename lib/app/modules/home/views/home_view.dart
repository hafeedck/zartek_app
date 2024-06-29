import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test_zartek/app/helper/colors/app_color.dart';
import 'package:machine_test_zartek/app/helper/common_widgets/appbar/home_appbar.dart';
import 'package:machine_test_zartek/app/modules/home/views/widgets/home_tab_widgets.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeAppBar(
          textLabel: '',
          visible: true,
        ),
        body: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : DefaultTabController(
                  length: controller.itemsList.length,
                  child: Column(children: [
                    TabBar(
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                      labelColor: AppColor.tabColor,
                      indicatorColor: AppColor.tabColor,
                      indicatorWeight: 3,
                      unselectedLabelStyle:
                          const TextStyle(fontWeight: FontWeight.bold),
                      unselectedLabelColor: AppColor.primaryTextColor,
                      onTap: (int index) {},
                      tabs: controller.itemsList
                          .map((item) => Tab(text: item.menuCategory))
                          .toList(),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: controller.itemsList
                            .map((item) => ItemBuilder(category: item))
                            .toList(),
                      ),
                    ),
                  ]),
                ),
        ));
  }
}
