/// Author: Shaik Mobin
/// Created on : 12-08-2022
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AppCon.dart';
import 'AppFonts.dart';
import 'appColors.dart';

class AppStyles {
  /*
 * Below Text Styles will have fixed font size.
 * But boldness, font family  & Color Can be Customizable.
 *
  */
  static xlargeText({
    Color? color,
    bold,
    String? fontFamily,
  }) {
    return TextStyle(
      color: color ?? AppColors.textColor,
      fontSize: Constants.xlargeFont,
      fontWeight: bold ?? FontWeight.w400,
      fontFamily: fontFamily ?? AppFonts.primaryFont,
    );
  }

  static largeText({
    Color? color,
    bold,
    String? fontFamily,
  }) {
    return TextStyle(
      color: color ?? AppColors.textColor,
      fontSize: Constants.largeFont,
      fontWeight: bold ?? FontWeight.w400,
      fontFamily: fontFamily ?? AppFonts.primaryFont,
    );
  }

  static normalText({
    Color? color,
    bold,
    String? fontFamily,
  }) {
    return TextStyle(
      color: color ?? AppColors.textColor,
      fontSize: Constants.normalFont,
      fontWeight: bold ?? FontWeight.w400,
      fontFamily: fontFamily ?? AppFonts.primaryFont,
    );
  }

  static smallText({
    Color? color,
    bold,
    String? fontFamily,
  }) {
    return TextStyle(
      color: color ?? AppColors.textColor,
      fontSize: Constants.smallFont,
      fontWeight: bold ?? FontWeight.w400,
      fontFamily: fontFamily ?? AppFonts.primaryFont,
    );
  }

  /*
 * Below Text Styles will have fixed thickness.
 * But font size ,family & Color Can be Customizable.
 *
 * Bold      = w700
 * semiBold  = w600
 * regular   = w400
 * light     = w300
 * extraBold = w800
 *
 *
  */
  static boldText({Color? color, String? fontFamily, double? fontSize}) {
    return TextStyle(
      color: color ?? AppColors.textColor,
      fontFamily: fontFamily ?? AppFonts.primaryFont,
      fontSize: fontSize ?? Constants.largeFont,
      fontWeight: FontWeight.w700,
    );
  }

  static semiBoldText({
    Color? color,
    double? fontSize,
    String? fontFamily,
  }) {
    return TextStyle(color: color ?? AppColors.textColor, fontFamily: fontFamily ?? AppFonts.primaryFont, fontSize: fontSize ?? Constants.mediumFont, fontWeight: FontWeight.w600);
  }

  static mediumBoldText({
    Color? color,
    double? fontSize,
    String? fontFamily,
  }) {
    return TextStyle(color: color ?? AppColors.textColor, fontFamily: fontFamily ?? AppFonts.primaryFont, fontSize: fontSize ?? Constants.mediumFont, fontWeight: FontWeight.w500);
  }


  static regularText({
    Color? color,
    double? fontSize,
    String? fontFamily,
  }) {
    return TextStyle(color: color ?? AppColors.textColor, fontFamily: fontFamily ?? AppFonts.primaryFont, fontSize: fontSize ?? Constants.normalFont, fontWeight: FontWeight.w400);
  }

  /*
  *
  * Below TextStyle is FreeHand Style
  * All Params can changed accordingly
  *
  * */

  static customText({
    Color? color,
    double? fontSize,
    bold,
    String? fontFamily,
  }) {
    return TextStyle(color: color ?? AppColors.textColor, fontFamily: fontFamily ?? AppFonts.primaryFont, fontSize: fontSize ?? Constants.normalFont, fontWeight: FontWeight.w400);
  }

/*
  *
  * Strongly Recommend to create new styles as per design requirments for easy access.
  *
  * */

}
