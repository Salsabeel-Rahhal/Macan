import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/shops_controller.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key, this.shopList1});
  ShopsController shopController = Get.put(ShopsController());
  List<dynamic>? shopList1;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
