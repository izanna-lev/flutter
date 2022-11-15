import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tralever_module/custem_class/constant/app_settings.dart';
import 'package:tralever_module/ui/shared/appbar.dart';

class ActivityMapDetails extends StatefulWidget {
  static const String routeName = "/ActivityMapDetails";

  const ActivityMapDetails({Key? key}) : super(key: key);

  @override
  State<ActivityMapDetails> createState() => _ActivityMapDetailsState();
}

class _ActivityMapDetailsState extends State<ActivityMapDetails> {
  final Set<Marker> _markers = Set();

  final CameraPosition _initialPosition =
      const CameraPosition(target: LatLng(26.8206, 30.8025));
  final Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppbar(titleText: "Activity Details"),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GoogleMap(
            zoomControlsEnabled: false,
            markers: _markers,
            mapType: MapType.terrain,
            onMapCreated: _onMapCreated,
            initialCameraPosition: _initialPosition,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 50, horizontal: kDefaultPadding),
            child: Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://www.hlimg.com/images/things2do/738X538/dumas-beach_1506004479t.jpg"),
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
                        children: const [
                          Text(
                            "Seco Island - Full Day Tour",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("Cebu City, Philippines"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
