import 'product_model.dart';
import 'package:flutter/foundation.dart';

class Cart extends ChangeNotifier {
  final List<Product> productsInCart = [];

  double get total {
    return productsInCart.fold(0.0, (double currentTotal, Product nextProduct) {
      return currentTotal + nextProduct.price;
    });
  }

  void addToCart(Product product) {
    productsInCart.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    productsInCart.remove(product);
    notifyListeners();
  }

  void removeAllFromCart() {
    productsInCart.clear();
    notifyListeners();
  }
}
