import 'dart:async';

import 'package:custom_marker/marker_icon.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:oduck/config/theme.dart';
import 'package:oduck/features/map/view/grid_screen.dart';
import 'package:oduck/features/map/view/widget/action_button.dart';
import 'package:oduck/features/map/view/widget/location_info.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _mapController = Completer();

  late LatLng current = const LatLng(0, 0);
  final Set<Marker> _markers = <Marker>{};

  Future<Position> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition();

    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 1,
    );

    StreamSubscription<Position> positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position? position) async {
      current = LatLng(position!.latitude, position.longitude);

      _markers.add(
        Marker(
          markerId: const MarkerId("currentLocation"),
          icon: await MarkerIcon.downloadResizePictureCircle(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwmVE8Ep8HFFzwble3NCWLT0KAIs5kclv_AA&usqp=CAU',
              size: 150,
              addBorder: true,
              borderColor: primaryColor,
              borderSize: 15),
          position: current,
        ),
      );

      setState(() {});
    });

    return position;
  }

  void _tapCurrentLocation() async {
    final cameraPosition = CameraPosition(
      target: current,
      zoom: 16.8,
    );

    GoogleMapController googleMapController = await _mapController.future;

    googleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController.complete(controller);
  }

  void _onGridTap() async {
    await showModalBottomSheet(
      useSafeArea: true,
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const GridScreen(),
    );
  }

  @override
  void initState() {
    _getCurrentLocation();

    _markers.add(
      Marker(
        markerId: const MarkerId("marker_1"),
        position: const LatLng(37.5506027, 126.9116103),
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            useRootNavigator: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0)),
            ),
            builder: (context) => const LocationInfo(),
          );
        },
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            myLocationButtonEnabled: false,
            initialCameraPosition: const CameraPosition(
              target: LatLng(37.5642135, 127.0016985),
              zoom: 12.0,
            ),
            markers: _markers,
          ),
          ActionButton(
            tag: "grid",
            bottom: 80,
            function: _onGridTap,
            backgroundColor: const Color(0xFF303030),
            icon: const Icon(
              Ionicons.grid,
            ),
          ),
          ActionButton(
            tag: "current",
            bottom: 16,
            function: _tapCurrentLocation,
            backgroundColor: const Color(0xFF303030),
            icon: const Icon(
              Icons.my_location_rounded,
            ),
          ),
        ],
      ),
    );
  }
}
