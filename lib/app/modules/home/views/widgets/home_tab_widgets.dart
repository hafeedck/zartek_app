import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test_zartek/app/helper/colors/app_color.dart';
import 'package:machine_test_zartek/app/helper/texts/text_widget.dart';
import 'package:machine_test_zartek/app/model/item_model.dart';
import 'package:machine_test_zartek/app/modules/cart/controllers/cart_controller.dart';
import 'package:machine_test_zartek/app/modules/home/controllers/home_controller.dart';
import 'package:machine_test_zartek/app/modules/home/views/widgets/category_card.dart';

class ItemBuilder extends GetView<HomeController> {
  final TableMenuList category;
  const ItemBuilder({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => controller.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : controller.itemsList.isEmpty
              ? Center(
                  child:
                      commonText2("No data", Colors.black, 15, FontWeight.w500),
                )
              : cartController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: category.categoryDishes.length,
                      physics: const ScrollPhysics(),
                      itemBuilder: (context, index) {
                        final items = category.categoryDishes[index];
                        final bgColor = index % 2 == 0
                            ? AppColor.phonebuttonColor
                            : AppColor.redColor;
                        return CategoryItemCard(
                          onTap: () {},
                          itemId: items.dishId,
                          name: items.dishName,
                          rate: items.dishPrice.toString(),
                          calories: items.dishCalories.toString(),
                          customization: items.addonCat.isEmpty
                              ? ""
                              : items.addonCat.first.addonCategory,
                          description: items.dishDescription,
                          imagePath: items.dishImage,
                          color: bgColor,
                          onTapAdd: () {
                            if (cartController.cartList.contains(items) ==
                                false) {
                              cartController.cartList.add(items);
                            }
                            cartController.addQty(items);
                          },
                          onTapMinus: () {
                            if (items.qty.value > 1) {
                              cartController.minusQty(items);
                            } else {
                              cartController.removeFromCart(items);
                            }
                          },
                        );
                      },
                    )),
    );
  }
}
