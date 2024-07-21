import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:test_nav_app/src/widgets/bottom_sheet.dart';
import 'package:test_nav_app/src/widgets/clickable_marker.dart';
import 'package:test_nav_app/src/widgets/navigation_button.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final MapController _mapController;

  int currentTracker = 0;
  bool showPopup = false;

  List<LatLng> get _mapPoints => const [
        LatLng(55.755793, 37.617134),
        LatLng(55.753793, 37.612134),
        LatLng(55.751793, 37.621134),
      ];

  LatLng currentLocation = const LatLng(55.757793, 37.612134);

  @override
  void initState() {
    _mapController = MapController();
    super.initState();
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  List<Marker> _getMarkers(List<LatLng> mapPoints) {
    return List.generate(
      mapPoints.length,
      (index) => Marker(
        rotate: true,
        point: mapPoints[index],
        child: ClickableMarker(
          showWidget: showPopup,
          markerFunction: () {
            showModalBottomSheet(
              context: context,
              shape: const ContinuousRectangleBorder(),
              barrierColor: Colors.white.withOpacity(0),
              builder: (BuildContext context) {
                return const BottomInfoSheet();
              },
            ).whenComplete(() {
              setState(() {
                showPopup = false;
              });
            });
          },
        ),
        width: 75,
        height: 75,
        alignment: Alignment.center,
      ),
    );
  }

  void _zoomMap(double zoomAmount) {
    _mapController.move(
        _mapController.camera.center, _mapController.camera.zoom + zoomAmount);
  }

  void _nextTracker() {
    if (currentTracker < _mapPoints.length - 1) {
      currentTracker += 1;
    } else {
      currentTracker = 0;
    }

    _mapController.move(_mapPoints[currentTracker], _mapController.camera.zoom);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: const MapOptions(
              initialCenter: LatLng(55.755793, 37.617134),
              initialZoom: 15,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.flutter_map_example',
              ),
              MarkerLayer(
                markers: _getMarkers(_mapPoints),
              ),
              MarkerLayer(
                markers: List.filled(
                  1,
                  Marker(
                      width: 55,
                      height: 55,
                      rotate: true,
                      child: Image.asset(
                        "lib/src/images/ic_my_tracker_46dp.png",
                      ),
                      point: currentLocation),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  NavigationButton(
                    imageName: 'lib/src/images/ic_zoom_plus_55dp.png',
                    onTap: () {
                      _zoomMap(1);
                    },
                  ),
                  NavigationButton(
                    imageName: 'lib/src/images/ic_zoom_minus_55dp.png',
                    onTap: () {
                      _zoomMap(-1);
                    },
                  ),
                  NavigationButton(
                    imageName: 'lib/src/images/ic_mylocation_55dp.png',
                    onTap: () {
                      _mapController.move(
                          currentLocation, _mapController.camera.zoom);
                    },
                  ),
                  NavigationButton(
                    imageName: 'lib/src/images/ic_next_tracker_55dp.png',
                    onTap: () {
                      _nextTracker();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
