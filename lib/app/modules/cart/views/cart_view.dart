import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test_zartek/app/helper/colors/app_color.dart';
import 'package:machine_test_zartek/app/helper/common_widgets/appbar/cart_appbar.dart';
import 'package:machine_test_zartek/app/helper/texts/text_widget.dart';
import 'package:machine_test_zartek/app/modules/cart/views/widgets/cart_card.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        textLabel: 'Order Summery',
        visible: false,
      ),
      body: Obx(() => controller.cartList.isEmpty
          ? Center(
              child: commonText2("No data", Colors.black, 15, FontWeight.w500),
            )
          : Container(
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(255, 240, 235, 235),
                    blurRadius: 2.0,
                    spreadRadius: 2),
              ], borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColor.phonebuttonColor),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          commonText2("${controller.cartList.length} Item-",
                              Colors.white, 15, FontWeight.w500),
                          commonText2("${controller.cartList.length} Item",
                              Colors.white, 15, FontWeight.w500),
                        ],
                      ),
                    ),
                  ).paddingOnly(left: 5, right: 5, top: 5, bottom: 15),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.cartList.length,
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, index) {
                      final items = controller.cartList[index];
                      final bgColor = index % 2 == 0
                          ? AppColor.phonebuttonColor
                          : AppColor.redColor;
                      return CartItemCard(
                        onTap: () {},
                        itemId: items.dishId,
                        name: items.dishName,
                        rate: items.dishPrice.toString(),
                        calories: items.dishCalories.toString(),
                        color: bgColor,
                        onTapAdd: () {
                          controller.addQty(items);
                        },
                        onTapMinus: () {
                          if (items.qty.value != 0) {
                            controller.minusQty(items);
                          }
                        },
                        totalrate: controller.calculateRate(
                            items.dishPrice, items.qty.value),
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      commonText2("${controller.cartList.length} Item-",
                          Colors.white, 15, FontWeight.w500),
                      commonText2("${controller.cartList.length} Item",
                          Colors.white, 15, FontWeight.w500),
                    ],
                  ),
                ],
              ),
            ).paddingAll(8)),
    );
  }
}
