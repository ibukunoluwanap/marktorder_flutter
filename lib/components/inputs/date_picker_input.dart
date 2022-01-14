import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:iconsax/iconsax.dart';
import 'package:marktorder/components/notification/snackbar_notification.dart';
import 'package:marktorder/utils/colors.dart';
import 'package:intl/intl.dart';

class DatePickerInput extends StatefulWidget {
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

  const DatePickerInput({
    Key? key, // icon
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
  }) : super(key: key);

  @override
  _DatePickerInputState createState() => _DatePickerInputState();
}

class _DatePickerInputState extends State<DatePickerInput> {
  DateTime datePicked =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  DateTime today =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      TextButton.icon(
        onPressed: () async {
          await showRoundedDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(DateTime.now().year - 100),
            lastDate: DateTime.now(),
            borderRadius: 10,
            height: MediaQuery.of(context).size.height / 4,
            theme: ThemeData(
              primarySwatch: CustomMaterialColor.green,
              textTheme: const TextTheme(
                bodyText1: TextStyle(color: CustomColor.blue),
                caption: TextStyle(
                    color: CustomColor.blue, fontWeight: FontWeight.bold),
              ),
            ),
            onTapDay: (DateTime dateTime, bool available) {
              if (!available) {
                if (!available) {
                  showDialog(
                      context: context,
                      builder: (c) => AlertDialog(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: CustomColor.gray, width: 0.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            titleTextStyle:
                                const TextStyle(color: CustomColor.blue),
                            title: const Center(
                                child: Text("This date cannot be selected.")),
                          ));
                }
              }
              setState(() {
                datePicked =
                    DateTime(dateTime.year, dateTime.month, dateTime.day);
              });
              return available;
            },
          );
        },
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
                  dateFormat.format(datePicked) == dateFormat.format(today)
                      ? widget.hintText
                      : dateFormat.format(datePicked),
                  textAlign: TextAlign.left,
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
                              bgColor: widget.notificationIconColor,
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
