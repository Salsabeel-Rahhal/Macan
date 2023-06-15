// import 'dart:async';

// import 'package:fab_circular_menu/fab_circular_menu.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_google_places/flutter_google_places.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:project/view/screen/favorite_page.dart';
// import 'package:project/view/screen/map_page.dart';
// import 'package:project/view/screen/resrvations_page.dart';
// import 'package:project/view/screen/setting_page.dart';
// import '../widget/bars/home_app_bar.dart';
// import 'home_page1.dart';

// class HomePage extends StatefulWidget {
//   HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   Completer<GoogleMapController> _controller = Completer();

//   final placesAuto = PlacesAutocompleteFormField(
//       apiKey: " AIzaSyDrGn--NujM3CHoOveNb-Xx4JNafXicakQ");
//   // final placeholder= Plac
//   final controller = TextEditingController();
//   final pageController = PageController();
//   final key = '<AIzaSyDrGn--NujM3CHoOveNb-Xx4JNafXicakQ>';
//   TextEditingController searchController = TextEditingController();

//   bool searchToggle = true;
//   bool raduisSlider = false;
//   bool pressedNear = false;
//   bool cardTapped = false;
//   bool getDirections = false;
//   final List<Widget> _pages = [
//     // Add your pages here
//     SettingPage(),
//     FavoritePage(),
//     HomePage(),
//     ReservationPage(),
//     MapPage(),
//   ];
//   int _currentPage = 2;
//   double zoomVal = 5.0;
//   String placeImg = '';
//   @override
//   void initState() {
//     super.initState();
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _currentPage = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//           preferredSize: Size.fromHeight(200.0), // here the desired height
//           child: HomeAppBar(textController: controller)),
//       body: Center(
//         child: Container(
//           margin: const EdgeInsets.symmetric(vertical: 10),
//           height: double.infinity,
//           child: ListView(
//             scrollDirection: Axis.vertical,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: Boxes("assets/images/nina.png", 30.054216, 31.337261,
//                     "Pizza Nina"),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: Boxes(
//                     "assets/images/nina.png", 30.054216, 31.337261, "ward"),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: Boxes(
//                     "assets/images/nina.png", 30.054216, 31.337261, "ward"),
//               ),
//             ],
//           ),
//         ),
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
//                     builder: (context) => MapPage(),
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
//               child: Text(
//             restaurantName,
//             style: const TextStyle(
//                 color: Color(0xff6200ee),
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold),
//           )),
//         ),
//         const SizedBox(height: 5.0),
//         Container(
//             child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             Container(
//                 child: const Text(
//               "4.1",
//               style: TextStyle(
//                 color: Colors.black54,
//                 fontSize: 18.0,
//               ),
//             )),
//             Container(
//               child: const Icon(
//                 Icons.star_rate_outlined,
//                 color: Colors.amber,
//                 size: 15.0,
//               ),
//             ),
//             Container(
//               child: const Icon(
//                 Icons.star_rate_outlined,
//                 color: Colors.amber,
//                 size: 15.0,
//               ),
//             ),
//             Container(
//               child: const Icon(
//                 Icons.star_rate_outlined,
//                 color: Colors.amber,
//                 size: 15.0,
//               ),
//             ),
//             Container(
//               child: const Icon(
//                 Icons.star_rate_outlined,
//                 color: Colors.amber,
//                 size: 15.0,
//               ),
//             ),
//             Container(
//               child: const Icon(
//                 Icons.star_rate_outlined,
//                 color: Colors.amber,
//                 size: 15.0,
//               ),
//             ),
//             Container(
//                 child: const Text(
//               "(946)",
//               style: TextStyle(
//                 color: Colors.black54,
//                 fontSize: 18.0,
//               ),
//             )),
//           ],
//         )),
//         const SizedBox(height: 5.0),
//         Container(
//             child: const Text(
//           "American \u00B7 \u0024\u0024 \u00B7 1.6 mi",
//           style: TextStyle(
//             color: Colors.black54,
//             fontSize: 18.0,
//           ),
//         )),
//         const SizedBox(height: 5.0),
//         Container(
//             child: const Text(
//           "Closed \u00B7 Opens 17:00 Thu",
//           style: TextStyle(
//               color: Colors.black54,
//               fontSize: 14.0,
//               fontWeight: FontWeight.w600),
//         )),
//       ],
//     );
//   }

//   // Future<void> _gotoLocation(double lat, double long) async {
//   //   final GoogleMapController controller = await _controller.future;
//   //   controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
//   //     target: LatLng(lat, long),
//   //     zoom: 15,
//   //     tilt: 50.0,
//   //     bearing: 45.0,
//   //   )));
//   // }

//   Widget Boxes(String image, double lat, double long, String restaurantName) {
//     return GestureDetector(
//       onTap: () {
//         // _gotoLocation(lat, long);
//       },
//       child: FittedBox(
//         child: Material(
//             color: Colors.white,
//             elevation: 14.0,
//             borderRadius: BorderRadius.circular(25.0),
//             shadowColor: Colors.deepPurple,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Container(
//                   width: 180,
//                   height: 180,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(25.0),
//                     child: Image(
//                       image: AssetImage(image),
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: myDetailsContainer1(restaurantName),
//                   ),
//                 ),
//               ],
//             )),
//       ),
//     );
//   }

// //   Widget _createBottomNavigationBar() {
// //     return Container(
// //       decoration: const BoxDecoration(
// //         gradient: LinearGradient(
// //           colors: [
// //             Color.fromARGB(255, 74, 20, 140),
// //             Color.fromARGB(255, 182, 153, 217)
// //           ],
// //           begin: Alignment.topLeft,
// //           end: Alignment.topRight,
// //           // stops: [0.0, 0.8],
// //           tileMode: TileMode.clamp,
// //         ),
// //       ),
// //       child: BottomNavigationBar(
// //         selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
// //         fixedColor: Colors.white,
// //         currentIndex: _currentPage,
// //         onTap: (index) {
// //           _onItemTapped(index);
// //           print(index);
// //         },
// //         showUnselectedLabels: false,
// //         backgroundColor: Colors.transparent,
// //         type: BottomNavigationBarType.fixed,
// //         elevation: 0,
// //         unselectedItemColor: Colors.white,
// //         selectedIconTheme: const IconThemeData(color: Colors.greenAccent),
// //         items: const [
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.settings, size: 22),
// //             label: "Settings",
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.favorite, size: 22),
// //             label: "Favorite",
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Icon(
// //               Icons.home,
// //               size: 22,
// //             ),
// //             label: "Home",
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.calendar_month, size: 22),
// //             label: "Reservations",
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.location_on, size: 22),
// //             label: "Map",
// //           ),
// //         ],
// //       ),
// //     );
// //   }}
// }
