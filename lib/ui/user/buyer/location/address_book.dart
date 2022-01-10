import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:marktorder/components/buttons/button.dart';
import 'package:marktorder/components/navigation/app_bar.dart';
import 'package:marktorder/utils/colors.dart';
import 'package:marktorder/utils/test_api.dart';

class AddressBook extends StatefulWidget {
  const AddressBook({Key? key}) : super(key: key);

  @override
  _AddressBookState createState() => _AddressBookState();
}

class _AddressBookState extends State<AddressBook> {
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
                  "Address Book",
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add New Address',
        child: const Icon(
          Iconsax.add,
          color: CustomColor.white,
        ),
        backgroundColor: CustomColor.blue,
      ),
    );
  }

  Widget addressBookCard() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double cardHeight = ((height / 100) * 20).toDouble();

    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
          itemCount: addressBookApi.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final item = addressBookApi[index];
            final fullname =
                "${item['first_name'].toString()} ${item['last_name'].toString()}";
            final address = item['address'].toString();
            final phoneNumber =
                "${item['phone_number'].toString()} / ${item['other_phone_number'].toString() != "" ? item['other_phone_number'].toString() : ""}";
            bool isPrimary = item['is_primary'] as bool;

            return Stack(children: [
              Container(
                width: width,
                height: cardHeight,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: CustomColor.darkGray,
                          spreadRadius: -2.0,
                          blurRadius: 5.0)
                    ],
                    color: CustomColor.gray,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Column(
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Iconsax.user,
                            color: CustomColor.darkGray,
                            size: 20.0,
                          ),
                          const SizedBox(height: 30.0, width: 5.0),
                          Expanded(
                            flex: 9,
                            child: Text(
                              fullname,
                              style: const TextStyle(
                                  color: CustomColor.blue,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          )
                        ]),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Iconsax.map,
                            color: CustomColor.darkGray,
                            size: 20.0,
                          ),
                          const SizedBox(height: 30.0, width: 5.0),
                          Expanded(
                            child: Text(
                              address,
                              style: const TextStyle(
                                  color: CustomColor.blue,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w300,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          )
                        ]),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Iconsax.call,
                            color: CustomColor.darkGray,
                            size: 20.0,
                          ),
                          const SizedBox(height: 30.0, width: 5.0),
                          Expanded(
                            child: Text(
                              phoneNumber,
                              style: const TextStyle(
                                  color: CustomColor.blue,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w300,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          )
                        ])
                  ],
                ),
              ),
              Positioned(
                  bottom: 5.0,
                  left: 15.0,
                  child: Button(
                      width: width / 3,
                      text: isPrimary ? "Primary" : "Set As Primary",
                      textColor: CustomColor.white,
                      bgColor: isPrimary ? CustomColor.blue : CustomColor.green,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      padding: const EdgeInsets.all(5.0),
                      borderRadius: 5.0,
                      onPressed: () {})),
              Positioned(
                  bottom: 0.0,
                  right: 15.0,
                  child: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    padding: const EdgeInsets.all(0.0),
                    alignment: Alignment.centerRight,
                    icon: const Icon(
                      Iconsax.trash,
                      color: CustomColor.red,
                    ),
                    onPressed: () {},
                  )),
              Positioned(
                  top: 0.0,
                  right: 15.0,
                  child: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    padding: const EdgeInsets.all(0.0),
                    alignment: Alignment.centerRight,
                    icon: const Icon(
                      Iconsax.brush_4,
                      color: CustomColor.green,
                    ),
                    onPressed: () {},
                  ))
            ]);
          }),
    );
  }
}
