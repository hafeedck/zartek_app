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
    List<Map<String, dynamic>> cartListJson = [];

    for (var items in cartList) {
      int addedQty = items.qty.value;
      Map<String, dynamic> addedcartItem = {
        'dishId': items.dishId,
        'dishName': items.dishName,
        'dishImage': items.dishImage,
        'dishDescription': items.dishDescription,
        'nexturl': "",
        'qty': addedQty,
        'dishType': items.dishType,
        'dishCalories': items.dishCalories,
        'dishPrice': items.dishPrice,
        'addonCat': [],
      };
      cartListJson.add(addedcartItem);
    }

    sharedPreferences.setString("cartdata", jsonEncode(cartListJson));
  }

  getData() async {
    cartList.clear();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.containsKey("cartdata")) {
      cartList.value = List<Map<String, dynamic>>.from(
              jsonDecode(sharedPreferences.getString("cartdata")!))
          .map((x) => CategoryDish(
                dishId: x["dishId"],
                dishName: x["dishName"],
                dishImage: x["dishImage"],
                dishDescription: x["dishDescription"],
                qty: RxInt(x["qty"]),
                nexturl: x["nexturl"] ?? '',
                dishType: x["dishType"],
                dishCalories: x["dishCalories"],
                dishPrice: x["dishPrice"],
                addonCat: (x["addonCat"] as List<dynamic>?)
                        ?.map((item) =>
                            AddonCat.fromJson(item as Map<String, dynamic>))
                        .toList() ??
                    [],
              ))
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
