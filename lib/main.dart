import 'package:flutter/material.dart';
import 'package:marktorder/UI/user/buyer/profile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marktorder/utils/colors.dart';
import 'package:marktorder/theme/theme.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var brightness = WidgetsBinding.instance!.window.platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;

    // setting status and navigation bar colors
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: isDarkMode ? CustomColor.blue : CustomColor.green,
      systemNavigationBarColor:
          isDarkMode ? CustomColor.blue : CustomColor.white,
      systemNavigationBarDividerColor:
          isDarkMode ? CustomColor.blue : CustomColor.white,
    ));
    return MaterialApp(
      color: isDarkMode ? CustomColor.blue : CustomColor.green,
      title: 'MarktOrder',
      theme: ThemeData(
          scaffoldBackgroundColor: CustomColor.white,
          colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: isDarkMode ? CustomColor.blue : CustomColor.green,
              primary: CustomColor.blue),
          fontFamily: GoogleFonts.poppins().fontFamily,
          textTheme: customTextTheme(context)),
      home: const Profile(),
    );
  }
}
