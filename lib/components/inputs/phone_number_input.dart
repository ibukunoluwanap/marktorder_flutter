import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:marktorder/components/notification/snackbar_notification.dart';
import 'package:marktorder/utils/colors.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumberInput extends StatefulWidget {
  // icon
  final IconData? suffixIcon;
  final IconData? prefixIcon;

  // color
  final Color notificationIconColor;

  // text
  final String hintText;
  final String notification;

  // size
  final double notificationIconSize;

  // condition
  final bool isNotification;
  final bool isDropdown;

  // keyboad
  final Brightness? keyboardAppearance;
  const PhoneNumberInput(
      {Key? key, // icon
      this.suffixIcon,
      this.prefixIcon,

      // color
      this.notificationIconColor = CustomColor.orange,

      // text
      this.hintText = "",
      this.notification = "",

      // size
      this.notificationIconSize = 16.0,

      // condition
      this.isNotification = false,
      this.isDropdown = false,

      // keyboad
      this.keyboardAppearance})
      : super(key: key);

  @override
  _PhoneNumberInputState createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      InternationalPhoneNumberInput(
        autoValidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.number,
        initialValue: PhoneNumber(isoCode: "NG"),
        selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
          leadingPadding: 0.0,
          trailingSpace: false,
        ),
        selectorTextStyle: const TextStyle(color: Colors.black),
        cursorColor: CustomColor.blue,
        textStyle: const TextStyle(
            decoration: TextDecoration.none,
            color: CustomColor.blue,
            height: 2.0),
        inputDecoration: InputDecoration(
          hintText: widget.hintText,
          prefixIconConstraints: const BoxConstraints(minWidth: 0.0),
          prefixIcon: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
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
        onInputChanged: (PhoneNumber number) {},
        onInputValidated: (bool value) {},
        onSaved: (PhoneNumber number) {},
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
