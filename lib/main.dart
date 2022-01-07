import 'package:flutter/material.dart';
import 'package:marktorder/UI/user/buyer/profile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marktorder/utils/color_constants.dart';
import 'package:marktorder/theme/theme.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
  // setting status and navigation bar colors
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: CustomColor.blue,
    statusBarColor: CustomColor.blue,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: CustomColor.white,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: CustomColor.green),
          fontFamily: GoogleFonts.poppins().fontFamily,
          textTheme: customTextTheme(context)),
      home: const Profile(),
    );
  }
}
