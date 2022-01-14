// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:io';
import 'dart:ui';
import 'package:blur/blur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marktorder/components/buttons/button.dart';
import 'package:marktorder/components/buttons/button_like_input.dart';
import 'package:marktorder/components/images/view_image.dart';
import 'package:marktorder/components/inputs/dropdown_input.dart';
import 'package:marktorder/components/inputs/input.dart';
import 'package:marktorder/components/inputs/date_picker_input.dart';
import 'package:marktorder/components/inputs/email_input.dart';
import 'package:marktorder/components/inputs/phone_number_input.dart';
import 'package:marktorder/components/inputs/state_input.dart';
import 'package:marktorder/components/navigation/app_bar.dart';
import 'package:marktorder/components/notification/snackbar_notification.dart';
import 'package:marktorder/ui/user/buyer/activities/pending_rating/pending_rating.dart';
import 'package:marktorder/ui/user/buyer/activities/recent_search.dart';
import 'package:marktorder/ui/user/buyer/location/address_book.dart';
import 'package:marktorder/ui/user/buyer/location/location.dart';
import 'package:marktorder/ui/user/buyer/saved_items/orders.dart';
import 'package:marktorder/ui/user/buyer/saved_items/wishlist.dart';
import 'package:marktorder/utils/colors.dart';
import 'package:marktorder/utils/global.dart';
import 'package:marktorder/utils/test_api.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ImagePicker _picker = ImagePicker();
  var _avatarImage;

  _imgFromCamera() async {
    final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 50,
        preferredCameraDevice: CameraDevice.front);

    setState(() {
      _avatarImage = File(image?.path as String);
    });
  }

  _imgFromGallery() async {
    final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        preferredCameraDevice: CameraDevice.front);

    setState(() {
      _avatarImage = File(image?.path as String);
    });
  }

  _showImagePicker(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.transparent,
        builder: (BuildContext context) {
          return ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                decoration: BoxDecoration(
                  color: CustomColor.blue.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Wrap(
                  children: [
                    ListTile(
                        leading: const Icon(Iconsax.image),
                        iconColor: CustomColor.gray,
                        title: const Text(
                          'Gallery',
                          style: TextStyle(color: CustomColor.green),
                        ),
                        onTap: () {
                          _imgFromGallery();
                          Navigator.of(context).pop();
                        }),
                    ListTile(
                      leading: const Icon(Iconsax.camera),
                      iconColor: CustomColor.gray,
                      title: const Text('Camera',
                          style: TextStyle(color: CustomColor.green)),
                      onTap: () {
                        _imgFromCamera();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // height
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        CustomAppBar(
          leadingIcon: Iconsax.arrow_left,
          leadingIconOnPress: () {},
          title: GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.bottomLeft,
              height: (((((height / 100) * 10).toDouble()) / 2) * 1.2) / 1.5,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(width: 1.0, color: CustomColor.darkGray))),
              child: Row(
                children: const [
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Iconsax.search_normal_1,
                      color: CustomColor.darkGray,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    flex: 9,
                    child: Text(
                      'Search for skills, products, sellers',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: CustomColor.darkGray),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actionIcon: Iconsax.setting_2,
          actionIconOnPress: () {},
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          profileHeader(),
          profile(),
          const SizedBox(height: 20.0),
        ]))
      ],
    ));
  }

  // profile header
  Widget profileHeader() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double avatarBannerHeight = ((height / 100) * 10).toDouble();
    double avatarBannerWidth = width.toDouble();

    final avatarTop = avatarBannerHeight - (avatarBannerHeight / 2);
    final avatarInnerRadius = avatarBannerHeight / 1.4;
    final avatarOutterRadius = avatarBannerHeight / 1.36;

    //building avatar banner
    Widget avatarBanner() {
      return Blur(
        blurColor: CustomColor.blue,
        child: SizedBox(
          width: width,
          height: avatarBannerHeight * 1.2,
          child: _avatarImage != null
              ? Image.file(
                  _avatarImage,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  "assets/images/image_placeholder.png",
                  fit: BoxFit.cover,
                ),
        ),
      );
    }

    // bulding avatar
    Widget avatar() => Positioned.fill(
          top: avatarTop,
          child: Align(
            alignment: Alignment.center,
            child: Stack(clipBehavior: Clip.none, children: [
              GestureDetector(
                onTap: () {
                  _avatarImage != null
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ViewImage(image: FileImage(_avatarImage))))
                      : Padding(
                          padding: const EdgeInsets.all(100.0),
                          child: const SnackBarNotification(
                                  message: "Upload an avatar!",
                                  mode: "MODERN",
                                  isIcon: false)
                              .show(context),
                        );
                },
                child: CircleAvatar(
                  radius: avatarOutterRadius,
                  backgroundColor: CustomColor.white,
                  child: CircleAvatar(
                    radius: avatarInnerRadius,
                    backgroundColor: CustomColor.gray,
                    backgroundImage: _avatarImage != null
                        ? FileImage(_avatarImage)
                        : const AssetImage(
                            "assets/images/image_placeholder.png",
                          ) as ImageProvider,
                  ),
                ),
              ),
              Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  child: MaterialButton(
                    padding: const EdgeInsets.all(2.0),
                    minWidth: 0.0,
                    height: 0.0,
                    elevation: 0.0,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onPressed: () {
                      _showImagePicker(context);
                    },
                    color: CustomColor.blue,
                    shape: const CircleBorder(),
                    child: const Icon(
                      Iconsax.add,
                      color: CustomColor.green,
                    ),
                  )),
            ]),
          ),
        );

    // return widget
    return SizedBox(
      width: avatarBannerWidth,
      height: avatarBannerHeight * 2,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          avatarBanner(),
          avatar(),
        ],
      ),
    );
  }

  // profile
  Widget profile() {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      child: Column(
        children: [
          // user information
          Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(bottom: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    "${firstUpper(userApi["first_name"].toString())} ${firstUpper(userApi["last_name"].toString())}",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: CustomColor.blue,
                    )),
                Text("@${userApi["username"].toString().toLowerCase()}",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: CustomColor.blue,
                    )),
              ],
            ),
          ),
          // profile header
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 5.0),
              child: const Text('Profile',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: CustomColor.green,
                  ))),
          // username input
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 10.0),
              child: Input(
                  prefixIcon: Iconsax.user,
                  hintText:
                      firstUpper(userApi["username"].toString()) ?? "Username",
                  isNotification: true,
                  notification: infoMessages["required"]!,
                  notificationIconColor: CustomColor.green)),
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
          // email address input
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 10.0),
              child: EmailInput(
                  prefixIcon: Iconsax.sms,
                  hintText:
                      firstUpper(userApi["email"].toString()).toLowerCase() ??
                          "Email Address",
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
              )),
          // birthday input
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 10.0),
              child: DatePickerInput(
                prefixIcon: Iconsax.hospital,
                suffixIcon: Iconsax.calendar_1,
                hintText:
                    firstUpper(userApi["birthday"].toString()) ?? "Birthday",
              )),
          // gender input
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 10.0),
              child: DropdownInput(
                  text: firstUpper(userApi["gender"].toString()) ?? "Gender",
                  list: genderChoice,
                  prefixIcon: Iconsax.people)),
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
          // save profile form
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 10.0),
              child: Button(
                  onPressed: () {},
                  textColor: CustomColor.white,
                  bgColor: CustomColor.green,
                  text: "Save")),
          // location header
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 10.0, bottom: 5.0),
              child: const Text('Location',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: CustomColor.green,
                  ))),
          // address book
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 10.0),
              child: ButtonLikeInput(
                text: "Address Book",
                prefixIcon: Iconsax.map,
                suffixIcon: Iconsax.arrow_right_34,
                onPress: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (_) => const AddressBook()));
                },
              )),
          // location
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 10.0),
              child: ButtonLikeInput(
                text: "Location",
                prefixIcon: Iconsax.location,
                suffixIcon: Iconsax.arrow_right_34,
                onPress: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (_) => const Location()));
                },
              )),
          // saved items header
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 10.0, bottom: 5.0),
              child: const Text('Saved Items',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: CustomColor.green,
                  ))),
          // wishlist
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 10.0),
              child: ButtonLikeInput(
                text: "Wishlist",
                prefixIcon: Iconsax.heart,
                suffixIcon: Iconsax.arrow_right_34,
                onPress: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (_) => const Wishlist()));
                },
              )),
          // recent search
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 10.0),
              child: ButtonLikeInput(
                text: "Orders",
                prefixIcon: Iconsax.shopping_cart,
                suffixIcon: Iconsax.arrow_right_34,
                onPress: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (_) => const Orders()));
                },
              )),
          // activities header
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 10.0, bottom: 5.0),
              child: const Text('Activities',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: CustomColor.green,
                  ))),
          // recent search
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 10.0),
              child: ButtonLikeInput(
                text: "Recent Search",
                prefixIcon: Iconsax.refresh_right_square,
                suffixIcon: Iconsax.arrow_right_34,
                onPress: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (_) => const RecentSearch()));
                },
              )),
          // pending rating
          Container(
              alignment: Alignment.topLeft,
              child: ButtonLikeInput(
                text: "Pending Rating",
                prefixIcon: Iconsax.star,
                suffixIcon: Iconsax.arrow_right_34,
                onPress: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (_) => const PendingRating()));
                },
              )),
        ],
      ),
    );
  }
}
