import 'package:flutter/material.dart';
import 'package:marktorder/utils/colors.dart';

class CustomAppBar extends StatefulWidget {
  // condition
  final bool floating;
  final bool pinned;
  final bool snap;

  // icon
  final IconData? leadingIcon;
  final Function()? leadingIconOnPress;
  final IconData? actionIcon;
  final Function()? actionIconOnPress;

  // widget
  final Widget title;

  const CustomAppBar({
    Key? key,
    // condition
    this.floating = true,
    this.pinned = true,
    this.snap = true,

    // icon
    this.leadingIcon,
    this.leadingIconOnPress,
    this.actionIcon,
    this.actionIconOnPress,

    // widget
    required this.title,
  }) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    // height
    double height = MediaQuery.of(context).size.height;
    double bannerHeight = ((height / 100) * 10).toDouble();
    double toolbarHeight = (bannerHeight / 2) * 1.2;

    // color theme
    var brightness = WidgetsBinding.instance!.window.platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;

    return SliverAppBar(
      floating: widget.floating,
      pinned: widget.pinned,
      snap: widget.snap,
      elevation: 0.0,
      backgroundColor: isDarkMode ? CustomColor.blue : CustomColor.green,
      foregroundColor: CustomColor.white,
      toolbarHeight: toolbarHeight,
      expandedHeight: toolbarHeight,
      leading: IconButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onPressed: widget.leadingIconOnPress,
        icon: Icon(widget.leadingIcon),
      ),
      title: widget.title,
      actions: [
        IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: widget.actionIconOnPress,
            icon: Icon(widget.actionIcon)),
      ],
    );
  }
}
