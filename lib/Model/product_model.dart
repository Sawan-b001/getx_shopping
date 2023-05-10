import 'package:get/get.dart';

class Product {
  final int id;
  final String productName;
  final String productDescription;
  final int price;

  Product(
      {required this.id,
      required this.productName,
      required this.productDescription,
      required this.price});

  final isFavorite = false.obs;
}
