import 'package:ecommerceapp/product.dart';

class AppState {
  static List<Product> wishlist = [];
  static List<Product> cart = [];

  static bool isFavorite(Product product) {
    return wishlist.contains(product);
  }
}