import 'package:get/get.dart';
import '../data/model/shops_model.dart';
import 'api_helper.dart';

class ShopsController extends GetxController {
  var shops = List<Shop>.empty(growable: true).obs;

  Future<List<Shop>> getAll() async {
    dynamic jsonObject = await ApiHelper().getRequest("/shop");
    List<Shop> result = [];
    jsonObject.forEach((json) {
      result.add(Shop.fromJson(json));
    });
    return result;
  }

  // void fetchShops() async {
  //   try {
  //     List<Shop> shop = [];
  //     var response = await ApiHelper().getRequest("/shop");

  //     response.forEach((Response) {
  //       shop.add(Shop.fromJson(Response));
  //     });

  //     shops.value = shop;
  //   } catch (ex) {
  //     rethrow;
  //   }
  // }
}
