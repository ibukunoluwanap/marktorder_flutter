import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:marktorder/components/notification/snackbar_notification.dart';
import 'package:marktorder/utils/colors.dart';

class ButtonLikeInput extends StatefulWidget {
  // icon
  final IconData? suffixIcon;
  final IconData? prefixIcon;

  // color
  final Color notificationIconColor;

  // text
  final String text;
  final String notification;

  // position
  final TextAlign textPosition;

  // function
  final Function()? onPress;

  // condition
  final bool isNotification;
  const ButtonLikeInput({
    Key? key, // icon
    this.suffixIcon,
    this.prefixIcon,

    // color
    this.notificationIconColor = CustomColor.orange,

    // text
    this.text = "",
    this.notification = "",

    // text position
    this.textPosition = TextAlign.left,

    // function
    this.onPress,

    // condition
    this.isNotification = false,
  }) : super(key: key);

  @override
  _ButtonLikeInputState createState() => _ButtonLikeInputState();
}

class _ButtonLikeInputState extends State<ButtonLikeInput> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      TextButton.icon(
        onPressed: widget.onPress,
        style: TextButton.styleFrom(
          primary: CustomColor.darkGray,
          backgroundColor: CustomColor.gray,
          minimumSize: const Size(0.0, 0.0),
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: CustomColor.gray, width: 0.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        icon: Icon(widget.prefixIcon, size: 20.0),
        label: Row(
          children: [
            Expanded(
                flex: 9,
                child: Text(
                  widget.text,
                  textAlign: widget.textPosition,
                )),
            Expanded(
                flex: 1,
                child: Icon(
                  widget.suffixIcon,
                  size: 20.0,
                )),
          ],
        ),
      ),
      Positioned(
          top: 5.0,
          right: 5.0,
          child: widget.isNotification
              ? InkWell(
                  onTap: () {
                    Padding(
                      padding: const EdgeInsets.all(100.0),
                      child: SnackBarNotification(
                              message: widget.notification,
                              mode: "MODERN",
                              bgColor: widget.notificationIconColor,
                              textSize: 12.0,
                              isIcon: false)
                          .show(context),
                    );
                  },
                  child: Icon(
                    Iconsax.info_circle5,
                    color: widget.notificationIconColor,
                    size: 16.0,
                  ),
                )
              : const SizedBox(
                  width: 0.0,
                  height: 0.0,
                ))
    ]);
  }
}
