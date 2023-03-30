import 'package:flutter/material.dart';

class Constan {
  static const pathImage = "assets/images";

  static const imgLogo = "$pathImage/ic_logo.png";
  static const imgBackgroundSplashDown =
      "$pathImage/ic_background_splash_down.png";
  static const imgBackgroundSplashUp = "$pathImage/ic_background_splash_up.png";
  static const icHome = "$pathImage/ic_home.png";
  static const icBook = "$pathImage/ic_book.png";
  static const icScan = "$pathImage/ic_scan.png";
  static const icLocation = "$pathImage/ic_location.png";
  static const icProfile = "$pathImage/ic_profile.png";
  static const icUserPhoto = "$pathImage/ic_user_photo.png";
  static const icEarningsHome = "$pathImage/ic_earnings_home.png";
  static const icLocationHome = "$pathImage/ic_location_home.png";
  static const icRecycleHome = "$pathImage/ic_recycle_home.png";
  static const imgOrganicWaste = "$pathImage/img_organic_waste.png";
  static const imgAnorganicWaste = "$pathImage/img_anorganic_waste.png";
  static const imgB3Waste = "$pathImage/img_b3_waste.png";
  static const imgRecycle1 = "$pathImage/img_recycle1.png";
  static const imgRecycle2 = "$pathImage/img_recycle2.png";
  static const imgRecycle3 = "$pathImage/img_recycle3.png";
  static const imgRecycle4 = "$pathImage/img_recycle4.png";

  static const margin20 = 20.0;
  static const margin16 = 16.0;
  static const margin8 = 8.0;
  static const margin4 = 4.0;

  static const MaterialColor primaryColor = MaterialColor(
    0xFF799502,
    // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff6d8602), //10%
      100: Color(0xff617702), //20%
      200: Color(0xff556801), //30%
      300: Color(0xff495901), //40%
      400: Color(0xff3d4b01), //50%
      500: Color(0xff303c01), //60%
      600: Color(0xff242d01), //70%
      700: Color(0xff181e00), //80%
      800: Color(0xff0c0f00), //90%
      900: Color(0xff000000), //100%
    },
  );

  static const MaterialColor sekunderColor = MaterialColor(
    0xFFbccf68,
    // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffa9ba5e), //10%
      100: Color(0xff96a653), //20%
      200: Color(0xff849149), //30%
      300: Color(0xff717c3e), //40%
      400: Color(0xff5e6834), //50%
      500: Color(0xff4b532a), //60%
      600: Color(0xff383e1f), //70%
      700: Color(0xff262915), //80%
      800: Color(0xff13150a), //90%
      900: Color(0xff000000), //100%
    },
  );
}

class ShareName {
  static const String keyisintro = "isintro";
  static const String keytoken = "token";
  static const String keyislogin = "islogin";

  //user
  static const String keyusername = "username";
  static const String keyemail = "email";
}
