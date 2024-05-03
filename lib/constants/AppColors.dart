import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xff625bff);
  static const Color primaryShade = Color(0xfff7f7ff);
  static const Color borderColor = Color(0xff282466);
  static const Color lightBorderColor = Color(0xffeceeef);
  static const Color greyBgColor = Color(0xfff2f2f2);
  static const Color greyColor = Color(0xffC0C0C0);
  static const Color iconColor = Color(0xff3e526a);
  static const Color whiteColor = Color(0xffffffff);
  static const Color accentColor = Color(0xff03c389);
  static const Color greenColor = Color(0xff7FBC70);
  static const Color appGreen = Color(0xff94c706);
  static const Color greenShade = Color(0xffe5f9f3);
  static const Color yellowColor = Color(0xfff9a642);
  static const Color amberColor =Color(0xfffebe67);
  static const Color yellowShade = Color(0xfffef7ec);
  static const Color redColor = Color(0xffda485a);
  static const Color redShade = Color(0xfffdebec);
  static const Color orangeColor = Color(0xfffe7133);
  static const Color orangeShade = Color(0xfffef1eb);
  static const Color textColor = Color(0xff425563);
  static const Color darkTextColor = Color(0xff000000);
  static const Color skyBlue = Color(0xff06090b);
  static const Color bgColor = Color(0xfff4f5f7);
  static const Color bgBlack = Color(0xff1c2b48);
  static const LinearGradient gradient = LinearGradient(colors: [AppColors.borderColor, AppColors.primaryColor,],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);
  static const LinearGradient amberGradient = LinearGradient(colors: [AppColors.yellowColor, AppColors.amberColor,],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);



  static MaterialColor createMaterialColor(Color color) {
    List<double> strengths = <double>[.05];
    final Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });

    return MaterialColor(color.value, swatch);
  }
}
