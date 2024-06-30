import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test_zartek/app/model/item_model.dart';
import 'package:machine_test_zartek/app/modules/cart/controllers/cart_controller.dart';
import 'package:machine_test_zartek/app/repository/category_repository.dart';

class HomeController extends GetxController {
  final pageIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxBool isOnTap = false.obs;
  final _apiJob = CategoryRepository();
  RxList<TableMenuList> itemsList = <TableMenuList>[].obs;
  final CartController cartController = Get.find();
  final GlobalKey<ScaffoldState> dealerDashboardscaffoldkey =
      GlobalKey<ScaffoldState>();

  @override
  void onInit() async {
    cartController.getData();
    getItems();
    super.onInit();
  }

  getItems() {
    isLoading(true);
    _apiJob.getItems().then((value) {
      setItemsList(value.first);
      isLoading(false);
    }).onError((error, stackTrace) {
      isLoading(false);
    });
  }

  void setItemsList(ItemModel value) {
    itemsList.clear();
    itemsList.addAll(value.tableMenuList);
  }

  addQty(CategoryDish items) {
    items.qty = items.qty++;
    update();
  }

  minusQty(CategoryDish items) {
    items.qty = items.qty--;
    update();
  }

 
}
