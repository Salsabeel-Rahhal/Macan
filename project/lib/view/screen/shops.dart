import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/data/static/static.dart';
import 'package:project/providers/shop_provider.dart';
import 'package:project/view/screen/profile_page.dart';
import 'package:project/view/screen/resrvations_page.dart';
import 'package:project/view/screen/setting_page.dart';
import 'package:project/view/widget/alert_exit_app.dart';
import 'package:provider/provider.dart';
import '../../controller/shops_controller.dart';
import '../../data/model/shops_model.dart';
import '../widget/bars/home_app_bar.dart';
import 'map_page.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final ShopsController shopController = Get.put(ShopsController());
  final controller = TextEditingController();
  bool active = false;

  Widget myDetailsContainer1(Shop shop) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              shop.shopName ?? "",
              style: const TextStyle(
                color: Color(0xff6200ee),
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                shop.priceRange ?? "",
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                shop.foodType ?? "",
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Icon(
                Icons.location_on,
                color: Colors.deepPurpleAccent,
              ),
              const SizedBox(height: 5.0),
              Text(
                shop.shopLocation ?? "",
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: Text(
                shop.rating ?? "",
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              )),
              const SizedBox(width: 8.0),
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
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget boxes(List<Shop> shopList) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.8, // set a finite height
      child: ListView.builder(
        itemCount: shopList.length,
        itemBuilder: (context, index) {
          Shop shop = shopList[index];
          return Container(
            margin: const EdgeInsets.all(12),
            child: GestureDetector(
              onTap: () {
                String shopName = shop.shopName!;
                String shopLocation = shop.shopLocation!;
                String foodType = shop.foodType!;
                String servicType = shop.serviceType!;
                String rating = shop.rating!;
                String priceRange = shop.priceRange!;
                String contactNumber = shop.contactNumber!;
                int myIndex = index;
                print(myIndex);

                Get.to(ReservationPage(
                  shopList1: [
                    shopName,
                    shopLocation,
                    foodType,
                    servicType,
                    rating,
                    priceRange,
                    contactNumber,
                    myIndex,
                  ],
                ));
              },
              child: FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(25.0),
                    shadowColor: Colors.deepPurple,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 180,
                          height: 180,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25.0),
                            child: Image(
                              image: NetworkImage(shopImageUrl[index].image),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: myDetailsContainer1(shop),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200.0),
        child: HomeAppBar(textController: controller),
      ),
      body: Container(
        child: Column(children: [
          Expanded(
            child: FutureBuilder(
              future: (() async {
                try {
                  return await shopController
                      .getAll(); // Fetch shop data from the API
                } catch (e) {
                  print('Error fetching shops: $e');
                  return null;
                }
              })(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error fetching shops: ${snapshot.error}');
                } else if (snapshot.hasData && snapshot.data != null) {
                  List<Shop> shopList =
                      (snapshot.data as List<dynamic>).cast<Shop>();
                  print(shopList);

                  return boxes(shopList);
                } else {
                  return const Text('No shops found');
                }
              },
            ),
          ),
        ]),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 74, 20, 140),
              Color.fromARGB(255, 182, 153, 217),
            ],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingPage(),
                  ),
                );
              },
              icon: const Icon(Icons.settings),
              color: Colors.white,
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilePage()));
                },
                icon: const Icon(
                  Icons.account_circle_rounded,
                  size: 25,
                  color: Colors.white,
                )),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShopPage(),
                  ),
                );
              },
              icon: const Icon(Icons.home),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {
                alertExitApp();
              },
              icon: const Icon(Icons.logout),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MapPage(),
                  ),
                );
              },
              icon: const Icon(Icons.location_on),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  _handleViewShops(Shop shop) {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return SizedBox(
                height: 230,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        shop.shopName!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        shop.shopLocation!,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        child: const Text('Add to Favorite'),
                        onPressed: () {
                          var shopProvider =
                              Provider.of<ShopProvier>(context, listen: false);
                          shopProvider.addToFavorite(shop);
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
