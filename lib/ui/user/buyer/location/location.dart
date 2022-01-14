import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:marktorder/components/buttons/button_like_input.dart';
import 'package:marktorder/utils/colors.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  final Completer<GoogleMapController> _mapController = Completer();

  static const LatLng _cameraTarget = LatLng(45.521563, -122.677433);

  _onMapCreated(GoogleMapController controller) {
    _mapController.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    // height
    double height = MediaQuery.of(context).size.height;
    double bannerHeight = ((height / 100) * 10).toDouble();
    double toolbarHeight = (bannerHeight / 2) * 1.2;

    return Stack(children: [
      Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark),
          backgroundColor: Colors.transparent,
          foregroundColor: CustomColor.blue,
          toolbarHeight: toolbarHeight,
          elevation: 0.0,
          leading: IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(Iconsax.arrow_left_24),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Container(
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Location & Map",
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "@pandoraloveth",
                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w300),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
        body: locationMap(),
        extendBody: true,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Current Location',
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const Icon(
            Icons.my_location_rounded,
            color: CustomColor.green,
          ),
          backgroundColor: CustomColor.white,
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: CustomColor.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          padding: const EdgeInsets.all(10.0),
          child: ButtonLikeInput(
            onPress: () {
              _searchMapPicker(context);
            },
            prefixIcon: Iconsax.location,
            text: "Find sellers near you",
          ),
        ),
      ),
    ]);
  }

  _searchMapPicker(context) {
    double height = MediaQuery.of(context).size.height;
    showCupertinoModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        topRadius: const Radius.circular(20.0),
        builder: (BuildContext context) => ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  height: height / 1.5,
                  color: CustomColor.white,
                ),
              ),
            ));
  }

  Widget locationMap() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width,
      height: height,
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition:
            const CameraPosition(target: _cameraTarget, zoom: 12.0),
        zoomControlsEnabled: false,
        myLocationEnabled: true,
      ),
    );
  }
}
