import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:marktorder/components/notification/snackbar_notification.dart';
import 'package:marktorder/utils/colors.dart';

class Input extends StatefulWidget {
  // icon
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final EdgeInsetsGeometry? suffixIconPadding;
  final EdgeInsetsGeometry prefixIconPadding;

  // color
  final Color notificationIconColor;

  // text
  final String hintText;
  final String notification;

  // size
  final double notificationIconSize;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;

  // condition
  final bool isNotification;
  final bool isDropdown;

  // keyboad
  final TextInputType? keyboardType;
  final Brightness? keyboardAppearance;

  const Input(
      {Key? key, // icon
      this.suffixIcon,
      this.prefixIcon,
      this.suffixIconPadding,
      this.prefixIconPadding =
          const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),

      // color
      this.notificationIconColor = CustomColor.orange,

      // text
      this.hintText = "",
      this.notification = "",

      // size
      this.notificationIconSize = 16.0,
      this.minLines,
      this.maxLines,
      this.maxLength,

      // condition
      this.isNotification = false,
      this.isDropdown = false,

      // keyboad
      this.keyboardType,
      this.keyboardAppearance})
      : super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      TextFormField(
        keyboardAppearance: widget.keyboardAppearance,
        keyboardType: widget.keyboardType,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        maxLength: widget.maxLength,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: CustomColor.blue,
        style: const TextStyle(
            decoration: TextDecoration.none,
            color: CustomColor.blue,
            height: 2.0),
        decoration: InputDecoration(
          hintText: widget.hintText,
          prefixIconConstraints: const BoxConstraints(minWidth: 0.0),
          prefixIcon: Padding(
            padding: widget.prefixIconPadding,
            child: Icon(widget.prefixIcon, color: CustomColor.darkGray),
          ),
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: CustomColor.gray, width: 0.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: CustomColor.gray, width: 0.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: CustomColor.red, width: 0.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: CustomColor.red, width: 0.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          fillColor: CustomColor.gray,
          filled: true,
          isDense: true,
          contentPadding: const EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 15.0),
        ),
        onSaved: (value) {},
        validator: (value) {},
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
                              bgColor: widget.notificationIconColor,
                              isIcon: false)
                          .show(context),
                    );
                  },
                  child: Icon(
                    Iconsax.info_circle5,
                    color: widget.notificationIconColor,
                    size: widget.notificationIconSize,
                  ),
                )
              : const SizedBox(
                  width: 0.0,
                  height: 0.0,
                ))
    ]);
  }
}
