import 'dart:convert';

import 'package:get/get.dart';
import 'package:machine_test_zartek/app/model/item_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends GetxController {
  RxList<CategoryDish> cartList = <CategoryDish>[].obs;
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void saveData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("cartdata", jsonEncode(cartList));

    // getData();
  }

  getData() async {
    cartList.clear();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.containsKey("cartdata")) {
      cartList.value = List<Map<String, dynamic>>.from(
              jsonDecode(sharedPreferences.getString("cartdata")!))
          .map((x) => CategoryDish.fromJson(x))
          .toList();
    }
  }

  void deleteData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove("cartdata");
  }

  addQty(CategoryDish items) {
    cartList.where((e) => e.dishId == items.dishId).first.qty =
        cartList.where((e) => e.dishId == items.dishId).first.qty++;
    deleteData();
    saveData();
    update();
  }

  minusQty(CategoryDish items) {
    cartList.where((e) => e.dishId == items.dishId).first.qty =
        cartList.where((e) => e.dishId == items.dishId).first.qty--;
    update();
  }

  String calculateRate(num a, num b) {
    num total = a * b;
    return total.toStringAsFixed(0);
  }
}
