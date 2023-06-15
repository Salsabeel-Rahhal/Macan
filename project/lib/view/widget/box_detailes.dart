// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../controller/shops_controller.dart';
// import '../../data/model/shops_model.dart';

// Widget myDetailsContainer1(String restaurantName) {
//   final ShopsController shopController = Get.put(ShopsController());
//   List<Shop> shopList = [];
//   return Container(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Expanded(
//           child: FutureBuilder(
//             future: (() async {
//               try {
//                 return await shopController.getAll();
//               } catch (e) {
//                 print('Error fetching shops: $e');
//                 return null;
//               }
//             })(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               }
//               if (snapshot.hasData && snapshot.data != null) {
//                 shopList = snapshot.data!.cast<Shop>();
//                 return ListView.builder(
//                   itemCount: shopList.length,
//                   itemBuilder: (context, index) {
//                     Shop shops = shopList[index];
//                     return Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 8.0),
//                           child: Container(
//                             child: Text(
//                               shops.shopName ?? "test",
//                               style: const TextStyle(
//                                 color: Color(0xff6200ee),
//                                 fontSize: 24.0,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 5.0),
//                         Container(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: <Widget>[
//                               Container(
//                                 child: Text(
//                                   shops.rating ?? "test",
//                                   style: const TextStyle(
//                                     color: Colors.black54,
//                                     fontSize: 18.0,
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 child: Text(
//                                   "${shops.foodType ?? "test"},${shops.priceRange ?? "test"}",
//                                   style: const TextStyle(
//                                     color: Colors.black54,
//                                     fontSize: 18.0,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 5.0),
//                         Container(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: <Widget>[
//                               Icon(
//                                 Icons.location_on,
//                                 color: Colors.black54,
//                               ),
//                               Text(
//                                 shops.shopLocation ?? "test",
//                                 style: TextStyle(
//                                   color: Colors.black54,
//                                   fontSize: 18.0,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               } else {
//                 return Text('No appointments found');
//               }
//             },
//           ),
//         ),
//       ],
//     ),
//   );
// }

// Widget Boxes() {
//   return GestureDetector(
//     onTap: () {},
//     child: FittedBox(
//       child: Material(
//         color: Colors.white,
//         elevation: 14.0,
//         borderRadius: BorderRadius.circular(24.0),
//         shadowColor: const Color(0x802196F3),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               width: 180,
//               height: 200,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(24.0),
//                 child: Image(
//                   image: NetworkImage(
//                     'https://pic.onlinewebfonts.com/svg/img_546302.png',
//                   ),
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//             Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: myDetailsContainer1(restaurantName),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
