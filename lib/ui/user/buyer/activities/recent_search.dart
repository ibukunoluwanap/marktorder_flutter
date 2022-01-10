import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:marktorder/components/buttons/transparent_button.dart';
import 'package:marktorder/components/navigation/app_bar.dart';
import 'package:marktorder/utils/colors.dart';
import 'package:marktorder/utils/test_api.dart';

class RecentSearch extends StatefulWidget {
  const RecentSearch({Key? key}) : super(key: key);

  @override
  _RecentSearchState createState() => _RecentSearchState();
}

class _RecentSearchState extends State<RecentSearch> {
  @override
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
                  "Recent Search",
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
            recentSearchList(),
            const SizedBox(height: 90.0),
          ]))
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        isExtended: true,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        tooltip: 'Clear Recent Search',
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.transparent, width: 0.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        label: Row(
          children: const [
            Icon(
              Iconsax.trash,
              color: CustomColor.white,
            ),
            Text(
              "Clear All",
              style: TextStyle(color: CustomColor.white),
            )
          ],
        ),
        backgroundColor: CustomColor.red,
      ),
    );
  }

  Widget recentSearchList() {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
          itemCount: recentSearchApi.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final item = recentSearchApi[index];
            final searchQuery = "${item["search_query"]}";

            return Column(
              children: [
                TransparentButton(
                    text: searchQuery,
                    textAlign: TextAlign.start,
                    fontSize: 16.0,
                    prefixIcon: Iconsax.refresh_right_square,
                    prefixIconColor: CustomColor.darkGray,
                    prefixIconPadding: const EdgeInsets.only(right: 10.0),
                    onPressed: () {}),
                const Divider(
                  height: 0.0,
                  indent: 10.0,
                  endIndent: 10.0,
                  color: CustomColor.darkGray,
                ),
              ],
            );
          }),
    );
  }
}
