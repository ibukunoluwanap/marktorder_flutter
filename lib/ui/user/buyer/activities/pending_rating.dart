import 'package:flutter/material.dart';
import 'package:marktorder/utils/color_constants.dart';

class PendingRating extends StatefulWidget {
  const PendingRating({Key? key}) : super(key: key);

  @override
  _PendingRatingState createState() => _PendingRatingState();
}

class _PendingRatingState extends State<PendingRating> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text(
            "PendingRating",
            style: TextStyle(color: CustomColor.green),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Back"))
        ],
      ),
    );
  }
}
