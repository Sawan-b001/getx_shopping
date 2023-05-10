import 'package:get/get.dart';
import 'package:getx_shopping/Model/product_model.dart';

class ShopppingController extends GetxController {
  var productList = <Product>[].obs;
  // List<Product> productList = [].obs as List<Product>;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProducts();
  }

  fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    var serverResponse = [
      Product(
          id: 1,
          productName: "Prod1",
          productDescription: "some description about products 1",
          price: 30),
      Product(
          id: 2,
          productName: "Prod2",
          productDescription: "some description about products 2",
          price: 40),
      Product(
          id: 3,
          productName: "Prod3",
          productDescription: "some description about products 3",
          price: 50),
      Product(
          id: 3,
          productName: "Prod4",
          productDescription: "some description about products 4",
          price: 60)
    ];
    productList.value = serverResponse;
  }
}
