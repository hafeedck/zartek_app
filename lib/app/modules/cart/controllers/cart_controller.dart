import 'dart:convert';
import 'package:get/get.dart';
import 'package:machine_test_zartek/app/helper/utils/utils.dart';
import 'package:machine_test_zartek/app/model/item_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends GetxController {
  RxList<CategoryDish> cartList = <CategoryDish>[].obs;
  RxBool isLoading = false.obs;
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

  placeOrder() {
    isLoading(true);
    for (var item in cartList) {
      item.qty.value = 0;
    }
    cartList.clear();
    deleteData();
    saveData();
    update();
    Get.back();
    Utils.toastMessage("Order successfully placed");
    isLoading(false);
  }

  void deleteData() async {
    isLoading(true);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove("cartdata");
    isLoading(false);
  }

  addQty(CategoryDish items) {
    isLoading(true);
    cartList.where((e) => e.dishId == items.dishId).first.qty =
        cartList.where((e) => e.dishId == items.dishId).first.qty++;
    deleteData();
    saveData();
    update();
    isLoading(false);
  }

  minusQty(CategoryDish items) {
    isLoading(true);
    cartList.where((e) => e.dishId == items.dishId).first.qty =
        cartList.where((e) => e.dishId == items.dishId).first.qty--;
    update();
    isLoading(false);
  }

  removeFromCart(CategoryDish items) {
    isLoading(true);
    cartList.removeWhere((e) => e.dishId == items.dishId);
    deleteData();
    saveData();
    update();
    isLoading(false);
  }

  String calculateRate(num a, num b) {
    num total = a * b;
    return total.toStringAsFixed(0);
  }
}
