import 'package:flutter/material.dart';
import 'package:gdsc_trash_app/pages/auth/login_page.dart';
import 'package:gdsc_trash_app/pages/home/menu_page.dart';
import 'package:gdsc_trash_app/utils/constan.dart';
import 'package:gdsc_trash_app/utils/helper.dart';
import 'package:package_info/package_info.dart';

class SplashscreenPage extends StatefulWidget {
  const SplashscreenPage({Key? key}) : super(key: key);

  @override
  _SplashscreenPageState createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage>
    with TickerProviderStateMixin {
  AnimationController? animationController, animationController1;
  Animation<double>? animation, animation1;

  String? versionName;

  @override
  void initState() {
    super.initState();
    getVersionLocal();

    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    animationController1 = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    animation =
        Tween<double>(begin: 0.5, end: 1.0).animate(animationController!)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              animationController1!.forward();
            }
          });

    animation1 =
        Tween<double>(begin: 0.5, end: 1.0).animate(animationController1!)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              checkFirstSeen();
            }
          });

    animationController!.forward();
  }

  void getVersionLocal() async {
    PackageInfo pInfo = await PackageInfo.fromPlatform();
    setState(() {
      versionName = pInfo.version;
    });
  }

  void checkFirstSeen() {
    // bool _seen;
    // getShareNameBool(ShareName.keyisintro).then((value) {
    //   _seen = value ?? false;
    //   if (_seen) {
    //     handleTimeComplete();
    //   } else {
    //     Helper.pushReplacementPageAnimation(context, IntroPage());
    //   }
    // });
    handleTimeComplete();
  }

  void handleTimeComplete() {
    bool islogin;
    getShareNameBool(ShareName.keyislogin).then((value) {
      islogin = value ?? false;
      if (islogin) {
        Helper.pushReplacementPageAnimation(context, MenuPage());
      } else {
        Helper.pushReplacementPageAnimation(context, LoginPage());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0x2B799502),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(Constan.imgBackgroundSplashDown,
                  width: double.infinity, fit: BoxFit.fitWidth),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(Constan.imgBackgroundSplashUp,
                  width: double.infinity, fit: BoxFit.fitWidth),
            ),
            Center(
              child: AnimatedBuilder(
                animation: animationController!,
                builder: (context, child) {
                  return Transform.scale(
                    scale: animation!.value,
                    child: Material(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Hero(
                            tag: "imglogo",
                            child: Image.asset(Constan.imgLogo,
                                width: 150, fit: BoxFit.contain),
                          ),
                          Container(height: 16),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: EdgeInsets.only(bottom: 20),
        child: Text("Version $versionName",
            style: TextStyle(color: Colors.black38)),
      ),
    );
  }
}
