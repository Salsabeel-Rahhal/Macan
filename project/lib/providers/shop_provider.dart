import 'package:flutter/material.dart';
import '../data/model/shops_model.dart';

class ShopProvier with ChangeNotifier {
  List<Shop> shopDetailes = [];
  String priceRange = "";
  String contactNumber = "";
  String image = "";
  String shopName = "";
  String shopLocation = "";
  String rating = "";

  final keyForm = GlobalKey<FormState>();

  addToFavorite(Shop shop) {
    shopDetailes.add(shop);
    notifyListeners();
  }

  removeProduct(int index) {
    shopDetailes.removeAt(index);

    notifyListeners();
  }
}
