import 'package:flutter/material.dart';
import 'package:marktorder/utils/color_constants.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return const Text(
      "Location",
      style: TextStyle(color: CustomColor.green),
    );
  }
}
