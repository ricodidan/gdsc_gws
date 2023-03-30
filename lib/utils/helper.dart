import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gdsc_trash_app/pages/auth/login_page.dart';
import 'package:gdsc_trash_app/utils/constan.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  static Future pushPage(BuildContext context, Widget page) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => page));
  }

  static Future pushReplacementPage(BuildContext context, Widget page) {
    return Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => page));
  }

  static Future pushPageAnimation(BuildContext context, Widget page) {
    return Navigator.push(context, FadePageRoute(widget: page));
  }

  static void pushReplacementPageAnimation(BuildContext context, Widget page) {
    Navigator.pushReplacement(context, FadePageRoute(widget: page));
  }

  static void actionLogout(BuildContext context) {
    setShareNameBool(ShareName.keyisintro, false);
    setShareNameBool(ShareName.keyislogin, false);
    removeShareName(ShareName.keytoken);
    removeShareName(ShareName.keyusername);

    Future.delayed(Duration.zero).then((_) => Navigator.of(context)
        .pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginPage()),
            (Route<dynamic> route) => false));
  }

  static void showToastPlugin(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black45,
        textColor: Colors.white,
        fontSize: 16);
  }

  static void showToastPluginSuccess(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green[200],
        textColor: Colors.white,
        fontSize: 16);
  }

  static void showToastPluginError(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.deepOrange[100],
        textColor: Colors.white,
        fontSize: 16);
  }

  static void showAlertConfirmation(BuildContext context, String title,
      String message, VoidCallback actionYes) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Text(message),
            actions: <Widget>[
              // ignore: deprecated_member_use
              TextButton(
                child: Text(
                  'Cancel',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              // ignore: deprecated_member_use
              TextButton(
                child: Text(
                  'OK',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  actionYes();
                },
              ),
            ],
          );
        });
  }

  static void showAlertInformation(
      BuildContext context, String title, String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Text(message),
            actions: <Widget>[
              // ignore: deprecated_member_use
              TextButton(
                child: Text(
                  'OK',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  static void showConfirmDialog(BuildContext context, String image,
      String title, String message, VoidCallback actionYes) {
    showDialog(
      context: context,
      barrierLabel: "BarrierConfirm",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (_) {
        return AlertDialog(
          titlePadding: EdgeInsets.all(8.0),
          contentPadding:
              EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          title: Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.close, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  Image.asset(
                    image,
                    width: 150,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8.0),
                    child: Text(
                      title,
                      style:
                          TextStyle(fontSize: 17, color: Constan.sekunderColor),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8.0),
                    child: Text(message, style: TextStyle(fontSize: 12)),
                  )
                ],
              ),
            ),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 30,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.white,
                    side: BorderSide(width: 1.0, color: Constan.sekunderColor),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                  child: Text(
                    'No',
                    style: TextStyle(color: Constan.sekunderColor),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    actionYes();
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Constan.sekunderColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                  child: Text(
                    'Yes',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static void showInfoDialog(BuildContext context, String image, String title,
      String message, VoidCallback actionYes) {
    showDialog(
      context: context,
      barrierLabel: "BarrierInfo",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (_) {
        return AlertDialog(
          titlePadding: EdgeInsets.all(8.0),
          contentPadding:
              EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          title: Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.close, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  Image.asset(
                    image,
                    width: 180,
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: 17, color: Constan.sekunderColor),
                        ),
                        Container(
                            padding: EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Constan.primaryColor),
                            child: Icon(Icons.check,
                                color: Colors.white, size: 12)),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8.0),
                    child: Text(message, style: TextStyle(fontSize: 12)),
                  )
                ],
              ),
            ),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 30,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    actionYes();
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Constan.sekunderColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                  child: Text(
                    'Yes',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static void showAlertExpiredToken(
      BuildContext context, VoidCallback actionYes) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return WillPopScope(
            onWillPop: () => Future.value(false),
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              title: Text(
                "Information",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: Text("Your token is Expired, Please login again"),
              actions: <Widget>[
                // ignore: deprecated_member_use
                TextButton(
                  child: Text(
                    'OK',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blueGrey),
                  ),
                  onPressed: () {
                    actionYes();
                  },
                ),
              ],
            ),
          );
        });
  }
}

class FadePageRoute extends PageRouteBuilder {
  final Widget widget;

  FadePageRoute({required this.widget})
      : super(pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return widget;
        }, transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child) {
          return FadeTransition(
              opacity: Tween(begin: 0.0, end: 1.0).animate(animation),
              child: child);
        });
}

Future setShareName(String key, value) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.setString(key, value);
}

Future<String?> getShareName(String key) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? namePrefs = preferences.getString(key);
  return namePrefs;
}

Future setShareNameDouble(String key, value) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.setDouble(key, value);
}

Future<double?> getShareNameDouble(String key) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  double? namaPrefs = preferences.getDouble(key);
  return namaPrefs;
}

Future setShareNameBool(String key, value) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.setBool(key, value);
}

Future<bool?> getShareNameBool(String key) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool? namePrefs = preferences.getBool(key);
  return namePrefs;
}

Future setShareNameArray(String key, List<String> value) async {
  List<String> list = value.map((e) => json.encode(e)).toList();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.setStringList(key, list);
}

Future<List<String>?> getShareNameArray(String key) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getStringList(key);
}

Future removeShareName(key) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.remove(key);
}

Future removeAllShareName() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.clear();
}

String myFormatNumber(String value) {
  var money = NumberFormat("#,###.###", "id");
  value = money.format(int.parse(value));
  return value;
}

String convertDateFull(DateTime now) {
  var formatter = DateFormat('dd MMM yyyy HH:mm:ss', 'id');
  return formatter.format(now);
}

String convertDateShort(DateTime now) {
  var formatter = DateFormat('EEEE, dd MMMM yyyy', 'id');
  return formatter.format(now);
}

String convertDate(DateTime now) {
  var formatter = DateFormat('dd MMMM yyyy', 'id');
  return formatter.format(now);
}

String convertDateShort24jam(String now) {
  DateTime convertdate = DateTime.parse(now);
  var formatter = DateFormat('dd-MM-yyyy HH:mm');
  return formatter.format(convertdate);
}

String convertDateShort24jamIndo(String now) {
  DateTime convertdate = DateTime.parse(now);
  var formatter = DateFormat('dd/MM/yyyy HH:mm');
  return formatter.format(convertdate);
}

DateTime setDate24jam(DateTime now) {
  var formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
  return DateTime.parse(formatter.format(now));
}

DateTime convertStringToDate(String datestr) {
  return DateTime.parse(datestr);
}

String formatterDate(DateTime now) {
  var formatter = DateFormat('yyyy-MM-dd', 'id');
  return formatter.format(now);
}

String getDifferenceDate(String dateDifference) {
  String result = "";
  DateTime convertCreatedDate = convertStringToDate(dateDifference);
  var differentDateday = DateTime.now().difference(convertCreatedDate).inDays;
  if (differentDateday > 7) {
    // show full date
    result = convertDateFull(convertCreatedDate);
  } else if (differentDateday < 1) {
    var differentDateHours =
        DateTime.now().difference(convertCreatedDate).inHours;
    // jika lebih dari 1 jam
    if (differentDateHours > 1) {
      // show jam
      result = "$differentDateHours Hour ago";
    } else {
      var differentDateMinute =
          DateTime.now().difference(convertCreatedDate).inMinutes;
      // show minute
      if (differentDateMinute <= 0) {
        result = "1 Minute ago";
      } else if (differentDateMinute > 60) {
        // show jam
        result = "$differentDateHours Hour ago";
      } else {
        // show minute
        result = "$differentDateMinute Minute ago";
      }
    }
  } else {
    // show day
    result = "$differentDateday Day ago";
  }
  return result;
}

String durationToString(int minutes) {
  var d = Duration(minutes: minutes);
  List<String> parts = d.toString().split(':');
  return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
}

String getImageFormat(String imagepath) {
  var lastIndex = imagepath.length;
  var startIndex = lastIndex - 3;
  var imageFormat = imagepath.substring(startIndex, lastIndex).toLowerCase();
  var resultImage = "";
  if (imageFormat == "jpeg") {
    resultImage = "jpg";
  } else {
    resultImage = imageFormat;
  }
  return resultImage.toLowerCase();
}

Future<ImageInfo> getInfoImageFile(String imgpath) async {
  Image img = Image.file(File(imgpath));
  final c = Completer<ImageInfo>();
  img.image
      .resolve(ImageConfiguration())
      .addListener(ImageStreamListener((ImageInfo i, bool _) {
    c.complete(i);
  }));
  return c.future;
}
