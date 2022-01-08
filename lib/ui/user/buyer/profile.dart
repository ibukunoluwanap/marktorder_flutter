import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:marktorder/components/bottom/button.dart';
import 'package:marktorder/components/inputs/dropdown_input.dart';
import 'package:marktorder/components/inputs/input.dart';
import 'package:marktorder/components/inputs/date_picker_input.dart';
import 'package:marktorder/components/inputs/email_input.dart';
import 'package:marktorder/components/inputs/phone_number_input.dart';
import 'package:marktorder/components/inputs/state_input.dart';
import 'package:marktorder/utils/color_constants.dart';
import 'package:marktorder/utils/global_constants.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        slivers: [
          appBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            profileHeader(),
            profile(),
          ]))
        ],
      )),
    );
  }

  // appbar
  Widget appBar() {
    double height = MediaQuery.of(context).size.height;
    double bannerHeight = ((height / 100) * 10).toDouble();
    double toolbarHeight = (bannerHeight / 2) * 1.2;

    return SliverAppBar(
      floating: true,
      pinned: true,
      snap: true,
      elevation: 0.0,
      backgroundColor: CustomColor.green,
      foregroundColor: CustomColor.white,
      toolbarHeight: toolbarHeight,
      expandedHeight: toolbarHeight,
      leading: IconButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onPressed: () {},
        icon: const Icon(Iconsax.arrow_left),
      ),
      title: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {},
        child: Container(
          alignment: Alignment.bottomLeft,
          height: toolbarHeight / 1.5,
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1.0, color: CustomColor.darkGray))),
          child: Row(
            children: const [
              Expanded(
                flex: 1,
                child: Icon(
                  Iconsax.search_normal,
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
      actions: [
        IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () {},
            icon: const Icon(Iconsax.setting_2)),
      ],
    );
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
              "assets/images/banner.jpg",
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
                    backgroundImage:
                        const AssetImage("assets/images/profile.jpg"),
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
    double width = MediaQuery.of(context).size.width;

    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      child: Column(
        children: [
          // user information
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(bottom: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Chioma Ifebunso',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: CustomColor.blue,
                    )),
                Text('@pandoraloveth',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
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
                  hintText: "Username",
                  isNotification: true,
                  notification: infoMessages["required"]!,
                  notificationIconColor: CustomColor.green)),
          // first name input
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 10.0),
              child: Input(
                  prefixIcon: Iconsax.user,
                  hintText: "First Name",
                  isNotification: true,
                  notification: infoMessages["required"]!,
                  notificationIconColor: CustomColor.green)),
          // last name input
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 10.0),
              child: Input(
                  prefixIcon: Iconsax.user,
                  hintText: "Last Name",
                  isNotification: true,
                  notification: infoMessages["required"]!,
                  notificationIconColor: CustomColor.green)),
          // email address input
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 10.0),
              child: EmailInput(
                  prefixIcon: Iconsax.sms,
                  hintText: "Email Address",
                  isNotification: true,
                  notification: infoMessages["required"]!,
                  notificationIconColor: CustomColor.green)),
          // phone number input
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 10.0),
              child: const PhoneNumberInput(
                prefixIcon: Iconsax.call,
                hintText: "Phone Number",
              )),
          // birthday input
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 10.0),
              child: const DatePickerInput(
                prefixIcon: Iconsax.hospital,
                suffixIcon: Iconsax.calendar_1,
                hintText: "Birthday",
              )),
          // gender input
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 10.0),
              child: DropdownInput(
                  text: "Gender",
                  list: [genderChoice["female"]!, genderChoice["male"]!],
                  prefixIcon: Iconsax.people)),
          // university input
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 10.0),
              child: Input(
                  prefixIcon: Iconsax.teacher,
                  hintText: "University",
                  isNotification: true,
                  notification: infoMessages["required"]!,
                  notificationIconColor: CustomColor.green)),
          // state input
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 10.0),
              child: StateInput(
                  isNotification: true,
                  notificationIconSize: 12.0,
                  notification: infoMessages["required"]!,
                  notificationIconColor: CustomColor.green)),
          // save profile form
          Row(
            children: [
              Expanded(
                  child: Button(
                      onPressed: () {},
                      bgColor: CustomColor.orange,
                      text: "Undo")),
              SizedBox(width: (width / 100) * 5),
              Expanded(
                  child: Button(
                      onPressed: () {},
                      textColor: CustomColor.white,
                      bgColor: CustomColor.green,
                      text: "Save")),
            ],
          ),
          // location header
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 5.0),
              child: const Text('Location',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: CustomColor.green,
                  ))),
          // saved items header
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 5.0),
              child: const Text('Saved Items',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: CustomColor.green,
                  ))),
          // activities header
          Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 5.0),
              child: const Text('Activities',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: CustomColor.green,
                  ))),
        ],
      ),
    );
  }
}
