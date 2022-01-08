import 'package:flutter/material.dart';
import 'package:marktorder/UI/user/buyer/profile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marktorder/utils/color_constants.dart';
import 'package:marktorder/theme/theme.dart';
import 'package:flutter/services.dart';

void main() {
  // setting status and navigation bar colors
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: CustomColor.green,
    systemNavigationBarDividerColor: CustomColor.green,
    statusBarColor: CustomColor.blue,
  ));
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: CustomColor.green,
      title: 'MarktOrder',
      theme: ThemeData(
          scaffoldBackgroundColor: CustomColor.white,
          colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: CustomColor.green, primary: CustomColor.blue),
          fontFamily: GoogleFonts.poppins().fontFamily,
          textTheme: customTextTheme(context)),
      home: const Profile(),
    );
  }
}
