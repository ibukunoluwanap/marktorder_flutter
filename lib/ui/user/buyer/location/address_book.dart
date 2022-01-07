import 'package:flutter/material.dart';
import 'package:marktorder/utils/color_constants.dart';

class AddressBook extends StatefulWidget {
  const AddressBook({Key? key}) : super(key: key);

  @override
  _AddressBookState createState() => _AddressBookState();
}

class _AddressBookState extends State<AddressBook> {
  @override
  Widget build(BuildContext context) {
    return const Text(
      "AddressBook",
      style: TextStyle(color: CustomColor.green),
    );
  }
}
