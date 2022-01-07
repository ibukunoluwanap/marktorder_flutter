import 'package:flutter/material.dart';
import 'package:marktorder/utils/color_constants.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    return const Text(
      "Wishlist",
      style: TextStyle(color: CustomColor.green),
    );
  }
}
