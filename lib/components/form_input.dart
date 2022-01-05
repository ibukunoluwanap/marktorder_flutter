import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:marktorder/components/snackbar_notification.dart';
import 'package:marktorder/utils/color_constants.dart';

class FormInput {
  // type
  final String type;

  // icon
  final IconData? suffixIcon;
  final IconData? prefixIcon;

  // color
  final Color notificationIconColor;

  // text
  final String hintText;
  final String notification;

  // condition
  final bool isNotification;
  final bool isDropdown;

  // keyboad
  final TextInputType? keyboardType;
  final Brightness? keyboardAppearance;

  const FormInput(
      {
      // type
      this.type = "normal",

      // icon
      this.suffixIcon,
      this.prefixIcon,

      // color
      this.notificationIconColor = CustomColor.orange,

      // text
      this.hintText = "",
      this.notification = "",

      // condition
      this.isNotification = false,
      this.isDropdown = false,

      // keyboad
      this.keyboardType,
      this.keyboardAppearance});

  input(BuildContext context) {
    return Stack(children: [
      TextFormField(
        autovalidateMode: AutovalidateMode.always,
        cursorColor: CustomColor.blue,
        style: const TextStyle(
            decoration: TextDecoration.none,
            color: CustomColor.blue,
            height: 2.0),
        decoration: InputDecoration(
          hintText: hintText,
          prefixIconConstraints: const BoxConstraints(minWidth: 0.0),
          prefixIcon: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
            child: Icon(prefixIcon, color: CustomColor.darkGray),
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
          child: isNotification
              ? InkWell(
                  onTap: () {
                    Padding(
                      padding: const EdgeInsets.all(100.0),
                      child: SnackBarNotification(
                              message: notification,
                              mode: "MODERN",
                              bgColor: notificationIconColor,
                              textSize: 12.0,
                              isIcon: false)
                          .show(context),
                    );
                  },
                  child: Icon(
                    Iconsax.info_circle5,
                    color: notificationIconColor,
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



// Widget formInput(BuildContext _context, _icon, _hintText, _info) {
//   return Stack(children: [
//     TextFormField(
//       autovalidateMode: AutovalidateMode.always,
//       cursorColor: CustomColor.blue,
//       style: const TextStyle(
//           decoration: TextDecoration.none,
//           color: CustomColor.blue,
//           height: 2.0),
//       decoration: InputDecoration(
//         hintText: _hintText,
//         prefixIconConstraints: const BoxConstraints(minWidth: 0.0),
//         prefixIcon: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
//           child: Icon(_icon, color: CustomColor.darkGray),
//         ),
//         border: const OutlineInputBorder(),
//         enabledBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: CustomColor.gray, width: 0.0),
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: CustomColor.gray, width: 0.0),
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         fillColor: CustomColor.gray,
//         filled: true,
//         isDense: true,
//         contentPadding: const EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 15.0),
//       ),
//       onSaved: (value) {},
//       validator: (value) {},
//     ),
//     Positioned(
//         top: 5.0,
//         right: 5.0,
//         child: _info == ''
//             ? const SizedBox(
//                 width: 0.0,
//                 height: .0,
//               )
//             : InkWell(
//                 onTap: () {
//                   Padding(
//                     padding: const EdgeInsets.all(100.0),
//                     child: SnackBarNotification(
//                             message: _info,
//                             mode: "MODERN",
//                             bgColor: CustomColor.green,
//                             textSize: 12.0,
//                             isIcon: false)
//                         .show(_context),
//                   );
//                 },
//                 child: const Icon(
//                   Iconsax.info_circle5,
//                   color: CustomColor.green,
//                   size: 16.0,
//                 ),
//               ))
//   ]);
// }
