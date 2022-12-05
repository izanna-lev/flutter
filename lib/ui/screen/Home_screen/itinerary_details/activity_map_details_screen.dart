import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tralever_module/ui/screen/Home_screen/controller/itinerary_detaile_screen%20_controller.dart';

import '../../../../custem_class/constant/app_settings.dart';
import '../../../../services/api_routes.dart';
import '../../../shared/appbar.dart';

class ActivityMapDetails extends StatefulWidget {
  static const String routeName = "/ActivityMapDetails";

  ActivityMapDetails({Key? key}) : super(key: key);
  var data = Get.arguments;

  @override
  State<ActivityMapDetails> createState() => _ActivityMapDetailsState();
}

class _ActivityMapDetailsState extends State<ActivityMapDetails> {
  ItineraryDetailScreenController itineraryDetailScreenController =
      Get.find<ItineraryDetailScreenController>();
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  String? _currentAddress;
  Position? currentPosition;

  final CameraPosition _initialPosition =
      const CameraPosition(target: LatLng(37.422131, -122.08480));
  final Completer<GoogleMapController> _controller = Completer();

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
      mipmaps: true,
      const ImageConfiguration(size: Size(50, 50)),
      "assets/images/itinerary_details_images/ic_location.png",
    ).then((icon) {
      setState(() {
        markerIcon = icon;
      });
    });
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  // Future<void> _getCurrentPosition() async {
  //   final hasPermission = await _handleLocationPermission();
  //
  //   if (!hasPermission) return;
  //   await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
  //       .then((Position position) {
  //     setState(() => currentPosition = position);
  //     _getAddressFromLatLng(currentPosition!);
  //   }).catchError((e) {
  //     debugPrint(e);
  //   });
  // }

  // Future<void> _getAddressFromLatLng(Position position) async {
  //   await placemarkFromCoordinates(
  //           currentPosition!.latitude, currentPosition!.longitude)
  //       .then((List<Placemark> placemarks) {
  //     Placemark place = placemarks[0];
  //     setState(() {
  //       _currentAddress =
  //           '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
  //     });
  //   }).catchError((e) {
  //     debugPrint(e);
  //   });
  // }

  // void _onMapCreated(GoogleMapController controller) {
  //   _controller.complete(controller);
  // }

  @override
  void initState() {
    var image = widget.data[0];
    var locationName = widget.data[4];
    var activityName = widget.data[3];
    var locationCordinates = widget.data[2];
    var locationLong = widget.data[1];
    var hotelAppbarName = widget.data[5];
    // var activityAppbarName = widget.data[6];

    print('image===>${image}');
    print('locationName===>${locationName}');
    print('activityName===>${activityName}');
    print('location_LATITUDE===>${locationCordinates}');
    print('location_LONGITUDE===>${locationLong}');
    print('hotelAppbarName===>${hotelAppbarName}');
    // print('activityAppbarName===>${activityAppbarName}');
    // addCustomIcon();
    // _getCurrentPosition();
    // currentPosition;
    _handleLocationPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder:
          (ItineraryDetailScreenController itineraryDetailScreenController) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: commonAppbar(
              titleText: widget.data[5] == 1
                  ? "Hotel Reservations"
                  : widget.data[5] == 2
                      ? "Restaurant Reservations"
                      : "Activity Details",
            ),
            body: GetBuilder(
              builder: (ItineraryDetailScreenController
                  itineraryDetailScreenController) {
                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    GoogleMap(
                      // zoomControlsEnabled: false,
                      markers: {
                        Marker(
                          markerId: const MarkerId("onsite"),
                          position: LatLng(
                              // 21.1702, 72.8311
                              double.parse('${widget.data[2]}'),
                              double.parse('${widget.data[1]}')),
                          draggable: true,
                          onTap: () {
                            print(
                                'LATITUDE===>${double.parse('${widget.data[2]}')}');
                            print(
                                'LONGITUDE===>${double.parse('${widget.data[1]}')}');
                          },
                          icon: markerIcon,
                        )
                      },
                      myLocationEnabled: true,
                      mapType: MapType.terrain,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      initialCameraPosition: CameraPosition(
                        zoom: 13,
                        target: LatLng(
                            // 21.1702, 72.8311
                            double.parse('${widget.data[2]}'),
                            double.parse('${widget.data[1]}')),
                        // LatLng(37.422131, -122.08480),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 50, horizontal: kDefaultPadding),
                      child: Container(
                        height: 180,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(imageUrl + widget.data[0]
                                  // "https://www.hlimg.com/images/things2do/738X538/dumas-beach_1506004479t.jpg"
                                  ),
                              fit: BoxFit.cover,
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.data[4] ?? "Radisson Blu Hotel",
                                      // ?? "Seco Island - Full Day Tour",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(widget.data[3] ??
                                        "Cebu City, Philippines"),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                );
                // : const AppLoader();
              },
            ));
      },
    );
  }
}
