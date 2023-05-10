import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_shopping/Controllers/cart_controller.dart';
import 'package:getx_shopping/Controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({Key? key}) : super(key: key);

  final shoppingcontroller = Get.put(ShopppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: GetX<ShopppingController>(builder: (controller) {
              return ListView.builder(
                  itemCount: controller.productList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        height: 140,
                        width: double.infinity,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(controller
                                        .productList[index].productName),
                                    Text(controller
                                        .productList[index].productDescription)
                                  ],
                                ),
                                Text(
                                  "\$ ${controller.productList[index].price}",
                                  style: const TextStyle(fontSize: 25),
                                )
                              ],
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  cartController
                                      .addTocart(controller.productList[index]);
                                },
                                child: const Text("Add to Cart")),
                            Obx(() => IconButton(
                                onPressed: () {
                                  controller.productList[index].isFavorite
                                      .toggle();
                                },
                                icon: controller
                                        .productList[index].isFavorite.value
                                    ? Icon(Icons.check_box_rounded)
                                    : Icon(Icons.check_box_outline_blank)))
                          ],
                        ),
                      ),
                    );
                  });
            }),
          ),
          GetX<CartController>(builder: (controller) {
            return Text(
              "Total Amount : ${controller.cartAmount}",
              style: const TextStyle(fontSize: 30, color: Colors.white),
            );
          }),
          const SizedBox(height: 65)
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.amberAccent,
        onPressed: () {},
        icon: const Icon(
          Icons.shopping_cart_checkout_outlined,
          color: Colors.black,
        ),
        label: GetX<CartController>(builder: (controller) {
          return Text(
            controller.cartCount.toString(),
            style: const TextStyle(color: Colors.black),
          );
        }),
      ),
    );
  }
}
