import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marktorder/utils/colors.dart';
import 'package:photo_view/photo_view.dart';

class ViewImage extends StatefulWidget {
  final ImageProvider image;
  const ViewImage({Key? key, required this.image}) : super(key: key);

  @override
  _ViewImageState createState() => _ViewImageState();
}

class _ViewImageState extends State<ViewImage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: Container(
          color: CustomColor.white,
          child: Center(
            child: PhotoView(
              minScale: 0.5,
              imageProvider: widget.image,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          tooltip: 'Close',
          child: const Icon(
            Icons.close,
            color: CustomColor.white,
          ),
          backgroundColor: CustomColor.green,
        ),
      ),
    );
  }
}
