// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:project/controller/shops_controller.dart';
// import 'package:project/view/screen/auth/sign_in_page.dart';
// import 'package:project/view/screen/favorite_page.dart';
// import 'package:project/view/screen/resrvations_page.dart';
// import 'package:project/view/screen/setting_page.dart';

// import '../widget/bars/home_app_bar.dart';
// import 'map_page.dart';

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final ShopsController restaurantController = Get.put(ShopsController());

//   // GoogleMapsPlaces _places =
//   //     GoogleMapsPlaces(apiKey: 'AIzaSyDrGn--NujM3CHoOveNb-Xx4JNafXicakQ');
//   final controller = TextEditingController();

//   final key =
//       'AIzaSyDrGn--NujM3CHoOveNb-Xx4JNafXicakQ'; // removed '<' and '>' from the key
//   late String placeImg;

//   @override
//   void initState() {
//     super.initState();

//   }



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(200.0),
//         child: HomeAppBar(textController: controller),
//       ),
//       body: ListView.builder(
       
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile(
//             leading: CircleAvatar(
//               backgroundImage: _placesList[index].photos.isNotEmpty
//                   ? NetworkImage(_placesList[index].photos[0].photoReference)
//                   : null,
//             ),
//             title: Text(_placesList[index].name),
//             subtitle: Text(_placesList[index].vicinity!),
//           );
//         },
//       ),
//       bottomNavigationBar: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color.fromARGB(255, 74, 20, 140),
//               Color.fromARGB(255, 182, 153, 217),
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.topRight,
//           ),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             IconButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const SettingPage(),
//                   ),
//                 );
//               },
//               icon: const Icon(Icons.settings),
//               color: Colors.white,
//             ),
//             IconButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const FavoritePage(),
//                   ),
//                 );
//               },
//               icon: const Icon(Icons.favorite),
//               color: Colors.white,
//             ),
//             IconButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => MyHomePage(),
//                   ),
//                 );
//               },
//               icon: const Icon(Icons.home),
//               color: Colors.white,
//             ),
//             IconButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const ReservationPage(),
//                   ),
//                 );
//               },
//               icon: const Icon(Icons.calendar_month_outlined),
//               color: Colors.white,
//             ),
//             IconButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => SignInPage(),
//                   ),
//                 );
//               },
//               icon: const Icon(Icons.location_on),
//               color: Colors.white,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget myDetailsContainer1(String restaurantName) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.only(left: 8.0),
//           child: Container(
//             child: Text(
//               restaurantName,
//               style: const TextStyle(
//                 color: Color(0xff6200ee),
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(height: 5.0),
//         Container(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Container(
//                 child: const Text(
//                   "4.1",
//                   style: TextStyle(
//                     color: Colors.black54,
//                     fontSize: 18.0,
//                   ),
//                 ),
//               ),
//               Container(
//                 child: Text(
//                   "American • \$\$",
//                   style: const TextStyle(
//                     color: Colors.black54,
//                     fontSize: 18.0,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 5.0),
//         Container(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: const <Widget>[
//               Icon(
//                 Icons.location_on,
//                 color: Colors.black54,
//               ),
//               Text(
//                 "1.2 km",
//                 style: TextStyle(
//                   color: Colors.black54,
//                   fontSize: 18.0,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget Boxes(
//       double lat, double long, String restaurantName, String photoReference) {
//     return GestureDetector(
//       onTap: () {},
//       child: FittedBox(
//         child: Material(
//           color: Colors.white,
//           elevation: 14.0,
//           borderRadius: BorderRadius.circular(24.0),
//           shadowColor: const Color(0x802196F3),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Container(
//                 width: 180,
//                 height: 200,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(24.0),
//                   child: Image(
//                     image: NetworkImage(
//                       photoReference != ''
//                           ? 'https://maps.googleapis.com/maps/api/place/photo?parameters&photo_reference=$photoReference&key=$key&maxwidth=400'
//                           : 'https://pic.onlinewebfonts.com/svg/img_546302.png',
//                     ),
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//               Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: myDetailsContainer1(restaurantName),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
