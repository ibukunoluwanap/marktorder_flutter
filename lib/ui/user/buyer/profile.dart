import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:marktorder/components/button/button.dart';
import 'package:marktorder/components/button/button_like_input.dart';
import 'package:marktorder/components/inputs/dropdown_input.dart';
import 'package:marktorder/components/inputs/input.dart';
import 'package:marktorder/components/inputs/date_picker_input.dart';
import 'package:marktorder/components/inputs/email_input.dart';
import 'package:marktorder/components/inputs/phone_number_input.dart';
import 'package:marktorder/components/inputs/state_input.dart';
import 'package:marktorder/components/navigation/app_bar.dart';
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
  final GlobalKey _profileFormKey = GlobalKey();

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
          title: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
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
        ]))
      ],
    ));
  }

  // profile header
  Widget profileHeader() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double bannerHeight = ((height / 100) * 10).toDouble();
    double bannerWidth = width.toDouble();

    final avatarTop = bannerHeight - (bannerHeight / 2);
    final avatarInnerRadius = bannerHeight / 1.4;
    final avatarOutterRadius = bannerHeight / 1.36;

    //building banner
    Widget banner() {
      return Stack(children: [
        InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {},
          child: SizedBox(
            width: width,
            height: bannerHeight * 1.2,
            child: Image.asset(
              userApi["banner"].toString(),
              fit: BoxFit.cover,
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
            onPressed: () {},
            color: CustomColor.blue,
            shape: const CircleBorder(),
            child: const Icon(
              Iconsax.add,
              color: CustomColor.green,
              size: 20.0,
            ),
          ),
        ),
      ]);
    }

    // bulding avatar
    Widget avatar() => Positioned(
          top: avatarTop,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Stack(clipBehavior: Clip.none, children: [
              InkWell(
                onTap: () {},
                radius: avatarOutterRadius,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: CircleAvatar(
                  radius: avatarOutterRadius,
                  backgroundColor: CustomColor.white,
                  child: CircleAvatar(
                    radius: avatarInnerRadius,
                    backgroundColor: CustomColor.gray,
                    backgroundImage: AssetImage(userApi["avatar"].toString()),
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
                    onPressed: () {},
                    color: CustomColor.white,
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
      width: bannerWidth,
      height: bannerHeight * 2,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          banner(),
          avatar(),
        ],
      ),
    );
  }

  // profile
  Widget profile() {
    return Form(
      key: _profileFormKey,
      child: Container(
        margin: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        child: Column(
          children: [
            // user information
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "${firstUpper(userApi["first_name"].toString())} ${firstUpper(userApi["last_name"].toString())}",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: CustomColor.blue,
                      )),
                  Text(userApi["username"].toString().toLowerCase(),
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
                    hintText: firstUpper(userApi["username"].toString()) ??
                        "Username",
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
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (_) => const AddressBook()));
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
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (_) => const RecentSearch()));
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
            const SizedBox(
              height: 20.0,
            )
          ],
        ),
      ),
    );
  }
}
