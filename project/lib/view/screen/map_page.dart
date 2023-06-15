import 'dart:async';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/view/widget/search.dart';

class MapPage extends StatefulWidget {
  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  TextEditingController search = TextEditingController();
  bool searchToggle = true;
  bool getDirections = false;
  Timer? _debounce;
  Set<Marker> _markers = Set<Marker>();

  @override
  void initState() {
    super.initState();
  }

  double zoomVal = 5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          searchToggle
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(15, 40, 15, 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            controller: search,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 15.0),
                                border: InputBorder.none,
                                hintText: 'Search',
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        searchToggle = false;
                                        search.text = '';
                                      });
                                    },
                                    icon: const Icon(Icons.close))),
                            onChanged: (value) {
                              if (_debounce?.isActive ?? false)
                                _debounce?.cancel();
                              _debounce = Timer(
                                  const Duration(milliseconds: 700), () async {
                                // if (value.length > 2) {
                                //   if (!searchFlag.searchToggle) {
                                //     searchFlag.toggleSearch();
                                //     _markers = {};
                                //   }

                                //   List<AutoCompleteResult> searchResults =
                                //       await MapServices().searchPlaces(value);

                                //   allSearchResults.setResults(searchResults);
                                // } else {
                                //   List<AutoCompleteResult> emptyList = [];
                                //   allSearchResults.setResults(emptyList);
                                // }
                              });
                            },
                          ))
                    ],
                  ),
                )
              : Container(),
        ],
      ),
      floatingActionButton: FabCircularMenu(
          alignment: Alignment.bottomLeft,
          fabColor: Colors.white,
          fabOpenColor: Colors.green.shade300,
          ringDiameter: 250,
          ringWidth: 60,
          ringColor: Colors.green.shade300,
          fabSize: 60,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    searchToggle = true;

                    getDirections = false;
                  });
                },
                icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  setState(() {});
                },
                icon: const Icon(Icons.navigation))
          ]),
    );
  }

  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(40.712776, -74.005974), zoom: zoomVal)));
  }

  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(40.712776, -74.005974), zoom: zoomVal)));
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
            CameraPosition(target: LatLng(40.712776, -74.005974), zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          gramercyMarker,
        },
      ),
    );
  }

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 15,
      tilt: 50.0,
      bearing: 45.0,
    )));
  }
}

Marker gramercyMarker = Marker(
  markerId: MarkerId('gramercy'),
  position: LatLng(40.738380, -73.988426),
  infoWindow: InfoWindow(title: 'Gramercy Tavern'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
