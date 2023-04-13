import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:oduck/features/map/view/grid_screen.dart';
import 'package:oduck/features/map/view/widget/action_button.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _mapController;
  bool _myLocationEnabled = false;

  final LatLng _center = const LatLng(37.5518911, 126.9917937);

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  Future<void> _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition();
    final cameraPosition = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 18,
    );
    _mapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    setState(() {
      _myLocationEnabled = true;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            myLocationEnabled: _myLocationEnabled,
            myLocationButtonEnabled: false,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 12.0,
            ),
            markers: Set<Marker>.of(
              {
                const Marker(
                  markerId: MarkerId("marker_1"),
                  position: LatLng(37.5506027, 126.9116103),
                  infoWindow: InfoWindow(
                    title: "dddd",
                  ),
                ),
              },
            ),
          ),
          ActionButton(
            bottom: 80,
            function: _onGridTap,
            backgroundColor: const Color(0xFF303030),
            icon: const Icon(
              Ionicons.grid,
            ),
          ),
          ActionButton(
            bottom: 16,
            function: _getCurrentLocation,
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
