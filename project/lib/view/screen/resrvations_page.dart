import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/data/static/static.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../controller/shops_controller.dart';

class ReservationPage extends StatelessWidget {
  ReservationPage({super.key, required this.shopList1});
  final ShopsController shopController = Get.put(ShopsController());
  List<dynamic> shopList1;

  //          0    String shopName = shop.shopName!;
  //          1     String shopLocation = shop.shopLocation!;
  //          2    String foodType = shop.foodType!;
  //          3   String servicType = shop.serviceType!;
  //          4   String rating = shop.rating!;
  //          5   String priceRange = shop.priceRange!;
  //          6   String contactNumber = shop.contactNumber!;

  @override
  Widget build(BuildContext context) {
    final ShopsController shopController = Get.put(ShopsController());

    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 74, 20, 140),
        Color.fromARGB(255, 182, 153, 217)
      ])),
      child: Container(
        margin: const EdgeInsets.only(
          top: 130,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 120,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image(
                      image: NetworkImage(shopImageUrl[shopList1[7]].image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      shopList1[0],
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: const Icon(
                            Icons.star_rate_outlined,
                            color: Colors.grey,
                            size: 15.0,
                          ),
                        ),
                        Container(
                          child: const Icon(
                            Icons.star_rate_outlined,
                            color: Colors.amber,
                            size: 15.0,
                          ),
                        ),
                        Container(
                          child: const Icon(
                            Icons.star_rate_outlined,
                            color: Colors.amber,
                            size: 15.0,
                          ),
                        ),
                        Container(
                          child: const Icon(
                            Icons.star_rate_outlined,
                            color: Colors.amber,
                            size: 15.0,
                          ),
                        ),
                        Container(
                          child: const Icon(
                            Icons.star_rate_outlined,
                            color: Colors.amber,
                            size: 15.0,
                          ),
                        )
                      ],
                    ),
                    Text(
                      shopList1[4],
                      style: const TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            Divider(
              color: Colors.grey.shade400,
              thickness: 1.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  shopList1[1],
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.circle_rounded,
                  color: Colors.white,
                  size: 5,
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Icon(
                  Icons.restaurant_menu,
                  color: Colors.white,
                  size: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  shopList1[2],
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.circle_rounded,
                  color: Colors.white,
                  size: 5,
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Icon(
                  Icons.room_service,
                  color: Colors.white,
                  size: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  shopList1[3],
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.circle_rounded,
                  color: Colors.white,
                  size: 5,
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  shopList1[5],
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Price Range",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.circle_rounded,
                  color: Colors.white,
                  size: 5,
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 70),
              padding: const EdgeInsets.all(7),
              width: 120,
              height: 40,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    spreadRadius: 1.5,
                    blurRadius: 12,
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(2, 12)),
              ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: InkWell(
                  onTap: () async {
                    final Uri url = Uri(
                      scheme: 'tel',
                      path: shopList1[6],
                    );
                    await launchUrl(url);
                  },
                  child: const Text(
                    "Call Now",
                    style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
