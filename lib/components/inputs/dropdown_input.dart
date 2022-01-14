import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:marktorder/components/notification/snackbar_notification.dart';
import 'package:marktorder/utils/colors.dart';

class DropdownInput extends StatefulWidget {
  // text
  final String text;
  final List<String> list;
  final String notification;

  // icon
  final IconData prefixIcon;

  // color
  final Color notificationIconColor;

  // size
  final double notificationIconSize;
  final double dropdownHeight;

  // condition
  final bool isNotification;

  const DropdownInput({
    Key? key,
    // text
    required this.text,
    required this.list,
    this.notification = "",

    // icon
    required this.prefixIcon,

    // color
    this.notificationIconColor = CustomColor.orange,

    // size
    this.notificationIconSize = 16.0,
    this.dropdownHeight = 20.0,

    // condition
    this.isNotification = false,
  }) : super(key: key);

  @override
  _DropdownInputState createState() => _DropdownInputState();
}

class _DropdownInputState extends State<DropdownInput> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Stack(children: [
      TextDropdownFormField(
        options: widget.list,
        decoration: InputDecoration(
          hintText: widget.text,
          hintStyle: const TextStyle(
              decoration: TextDecoration.none,
              color: CustomColor.darkGray,
              height: 2),
          prefixIconConstraints: const BoxConstraints(minWidth: 0.0),
          prefixIcon: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
            child: Icon(widget.prefixIcon, color: CustomColor.darkGray),
          ),
          suffixIconConstraints: const BoxConstraints(minWidth: 0.0),
          suffixIcon: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
            child: Icon(Iconsax.arrow_down_14, color: CustomColor.darkGray),
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
        dropdownHeight: (height / 100) * widget.dropdownHeight,
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
