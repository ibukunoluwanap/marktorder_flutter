import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:marktorder/components/navigation/app_bar.dart';
import 'package:marktorder/utils/color_constants.dart';

class RatingStar extends StatefulWidget {
  const RatingStar({Key? key}) : super(key: key);

  @override
  _RatingStarState createState() => _RatingStarState();
}

class _RatingStarState extends State<RatingStar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomAppBar(
            pinned: false,
            leadingIcon: Iconsax.arrow_left,
            leadingIconOnPress: () {
              Navigator.of(context).pop();
            },
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Rating Star",
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "@pandoraloveth",
                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w300),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            actionIcon: Iconsax.search_normal_1,
            actionIconOnPress: () {},
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            const SizedBox(height: 10.0),
            addressBookCard(),
            const SizedBox(height: 90.0),
          ]))
        ],
      ),
    );
  }

  Widget addressBookCard() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double cardHeight = ((height / 100) * 20).toDouble();

    return Column(
      children: [
        Container(
          width: width,
          height: cardHeight,
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          // padding: const EdgeInsets.all(10.0),
          decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: CustomColor.darkGray,
                    spreadRadius: -2.0,
                    blurRadius: 5.0)
              ],
              color: CustomColor.gray,
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage("assets/images/seller6.jpg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 5.0, 5.0, 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Plan Polo T-shirt",
                        style: TextStyle(
                            color: CustomColor.blue,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Expanded(
                        child: Text(
                          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tincidunt magna et vehicula placerat. Aenean lacus nisi, aliquam sit amet neque eu, elementum tempus arcu. Vivamus congue rhoncus diam. Nam lectus nisl.""",
                          maxLines: 10,
                          style: TextStyle(
                              color: CustomColor.blue,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w300,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),

      ],
    );
  }
}
