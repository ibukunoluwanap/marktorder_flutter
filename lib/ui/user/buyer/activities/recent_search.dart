import 'package:flutter/material.dart';
import 'package:marktorder/utils/color_constants.dart';

class RecentSearch extends StatefulWidget {
  const RecentSearch({Key? key}) : super(key: key);

  @override
  _RecentSearchState createState() => _RecentSearchState();
}

class _RecentSearchState extends State<RecentSearch> {
  @override
  Widget build(BuildContext context) {
    return const Text(
      "RecentSearch",
      style: TextStyle(color: CustomColor.green),
    );
  }
}
