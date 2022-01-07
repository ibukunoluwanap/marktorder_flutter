import 'package:flutter/material.dart';
import 'package:marktorder/utils/color_constants.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return const Text(
      "Orders",
      style: TextStyle(color: CustomColor.green),
    );
  }
}
