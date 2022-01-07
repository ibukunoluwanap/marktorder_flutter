import 'package:flutter/material.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:marktorder/components/notification/snackbar_notification.dart';
import 'package:marktorder/utils/color_constants.dart';

class StateInput extends StatefulWidget {
  // color
  final Color notificationIconColor;

  // text
  final String notification;

  // size
  final double notificationIconSize;

  // condition
  final bool isNotification;
  final bool isDropdown;

  const StateInput({
    Key? key,
    // color
    this.notificationIconColor = CustomColor.orange,

    // text
    this.notification = "",

    // size
    this.notificationIconSize = 16.0,

    // condition
    this.isNotification = false,
    this.isDropdown = false,
  }) : super(key: key);

  @override
  _StateInputState createState() => _StateInputState();
}

class _StateInputState extends State<StateInput> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CSCPicker(
        defaultCountry: DefaultCountry.Nigeria,
        disableCountry: true,
        searchBarRadius: 10.0,
        dropdownDialogRadius: 10.0,
        dropdownHeadingStyle: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
            color: CustomColor.blue),
        dropdownItemStyle: const TextStyle(color: CustomColor.darkGray),
        disabledDropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.grey.shade300,
            border: Border.all(color: Colors.grey.shade300, width: 1.0)),
        dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: CustomColor.gray,
            border: Border.all(color: CustomColor.gray, width: 1.0)),
        onCountryChanged: (value) {
          print(value);
        },
        onStateChanged: (value) {
          print(value);
        },
        onCityChanged: (value) {
          print(value);
        },
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
                    size: widget.notificationIconSize,
                  ),
                )
              : const SizedBox(
                  width: 0.0,
                  height: 0.0,
                )),
    ]);
  }
}