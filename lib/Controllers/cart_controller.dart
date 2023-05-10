import 'package:get/get.dart';
import 'package:getx_shopping/Model/product_model.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;

  int get cartCount => cartItems.length;

  double get cartAmount =>
      cartItems.fold(0, (sum, element) => sum + element.price);

  addTocart(Product product) {
    cartItems.add(product);
  }
}
