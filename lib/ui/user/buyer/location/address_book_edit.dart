import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:marktorder/components/buttons/button.dart';
import 'package:marktorder/components/inputs/dropdown_input.dart';
import 'package:marktorder/components/inputs/input.dart';
import 'package:marktorder/components/inputs/phone_number_input.dart';
import 'package:marktorder/components/inputs/state_input.dart';
import 'package:marktorder/components/navigation/app_bar.dart';
import 'package:marktorder/utils/colors.dart';
import 'package:marktorder/utils/global.dart';
import 'package:marktorder/utils/test_api.dart';

class AddressBookEdit extends StatefulWidget {
  const AddressBookEdit({Key? key}) : super(key: key);

  @override
  _AddressBookEditState createState() => _AddressBookEditState();
}

class _AddressBookEditState extends State<AddressBookEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        CustomAppBar(
          pinned: false,
          leadingIcon: Iconsax.arrow_left,
          leadingIconOnPress: () {},
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Edit Address",
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "@pandoraloveth",
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w300),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          actionIcon: Iconsax.setting_2,
          actionIconOnPress: () {},
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          addressEdit(),
        ]))
      ],
    ));
  }

  // profile
  Widget addressEdit() {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      child: Column(
        children: [
          // edit address header
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 5.0),
              child: const Text('Edit Address',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: CustomColor.green,
                  ))),
          // first name input
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 10.0),
              child: Input(
                  prefixIcon: Iconsax.user,
                  hintText: firstUpper(userApi["first_name"].toString()) ??
                      "First Name",
                  isNotification: true,
                  notification: infoMessages["required"]!,
                  notificationIconColor: CustomColor.green)),
          // last name input
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 10.0),
              child: Input(
                  prefixIcon: Iconsax.user,
                  hintText: firstUpper(userApi["last_name"].toString()) ??
                      "Last Name",
                  isNotification: true,
                  notification: infoMessages["required"]!,
                  notificationIconColor: CustomColor.green)),
          // phone number input
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 10.0),
              child: PhoneNumberInput(
                  prefixIcon: Iconsax.call,
                  hintText: firstUpper(userApi["phone_number"].toString()) ??
                      "Phone Number",
                  isNotification: true,
                  notification: infoMessages["required"]!,
                  notificationIconColor: CustomColor.green)),
          // additional phone number input
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 10.0),
              child: PhoneNumberInput(
                prefixIcon: Iconsax.call,
                hintText:
                    firstUpper(userApi["additional_phone_number"].toString()) ??
                        "Additional Phone Number",
              )),
          // address input
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 10.0),
              child: Input(
                  prefixIcon: Iconsax.map,
                  hintText:
                      firstUpper(userApi["address"].toString()) ?? "Address",
                  isNotification: true,
                  notification: infoMessages["required"]!,
                  notificationIconColor: CustomColor.green)),
          // additional input
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 10.0),
              child: Input(
                prefixIcon: Iconsax.map,
                hintText:
                    firstUpper(userApi["additional_address"].toString()) ??
                        "Additional Address",
              )),

          // university input
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 10.0),
              child: DropdownInput(
                  text: firstUpper(userApi["university"].toString()) ??
                      "University",
                  list: university,
                  prefixIcon: Iconsax.teacher,
                  dropdownHeight: 50,
                  isNotification: true,
                  notificationIconSize: 14.0,
                  notification: infoMessages["required"]!,
                  notificationIconColor: CustomColor.green)),
          // state input
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 10.0),
              child: StateInput(
                  statePlaceholder: firstUpper(userApi["state"].toString()),
                  cityPlaceholder: firstUpper(userApi["city"].toString()),
                  isNotification: true,
                  notificationIconSize: 12.0,
                  notification: infoMessages["required"]!,
                  notificationIconColor: CustomColor.green)),
          // save address form
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 10.0),
              child: Button(
                  onPressed: () {},
                  textColor: CustomColor.white,
                  bgColor: CustomColor.green,
                  text: "Save")),
          const SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }
}
