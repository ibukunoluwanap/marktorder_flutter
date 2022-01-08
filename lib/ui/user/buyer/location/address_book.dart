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
    return Scaffold(
      body: Column(
        children: [
          const Text(
            "AddressBook",
            style: TextStyle(color: CustomColor.green),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Back"))
        ],
      ),
    );
  }
}
