import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gdsc_trash_app/pages/home/home_page.dart';
import 'package:gdsc_trash_app/utils/constan.dart';
import 'package:gdsc_trash_app/utils/helper.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  DateTime? currentBackPressTime;

  late List<Widget> _pages;
  late Widget _page1;
  late Widget _page2;
  late Widget _page3;
  late Widget _page4;
  late Widget _page5;
  late Widget _currentPage;
  var _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _page1 = HomePage();
    _page2 = HomePage();
    _page3 = HomePage();
    _page4 = HomePage();
    _page5 = HomePage();

    _pages = [_page1, _page2, _page3, _page4, _page5];

    _currentIndex = 0;
    _currentPage = _page1;
  }

  actionSelectedIndexTab(int index) {
    setState(() {
      _currentIndex = index;
      _currentPage = _pages[index];
    });
  }

  Future<bool> onWillPop() async {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Helper.showToastPlugin("Press again to exit");
      return Future.value(false);
    }

    // exit app
    SystemNavigator.pop();
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.white,
          titleSpacing: 8.0,
          elevation: 0,
          toolbarHeight: 70,
          title: Container(
            margin: EdgeInsets.only(top: 16, left: 8, right: 8, bottom: 16),
            child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 8.0),
                      child: Image.asset(Constan.icUserPhoto,
                          width: 40, height: 40, fit: BoxFit.contain),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello,",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        Text(
                          "Axel.",
                          style: TextStyle(
                              fontSize: 17,
                              color: Constan.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
          actions: [
            IconButton(
              tooltip: "Search",
              constraints: BoxConstraints(),
              icon: Icon(Icons.notifications_outlined),
              onPressed: () {
                // Helper.pushPage(context, ChatListPage());
              },
            ),
            if (_currentIndex == 4)
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: IconButton(
                  tooltip: "Setting",
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    // Helper.pushPage(context, SettingPage());
                  },
                ),
              ),
          ],
        ),
        bottomNavigationBar: Hero(
          tag: "herologin",
          child: Container(
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xffd9d9f5),
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
            child: SalomonBottomBar(
              currentIndex: _currentIndex,
              onTap: actionSelectedIndexTab,
              itemPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              items: [
                SalomonBottomBarItem(
                  icon: Image.asset(Constan.icHome, width: 20, height: 20),
                  activeIcon: Image.asset(Constan.icHome,
                      width: 20, height: 20, color: Constan.primaryColor),
                  title: Text("Home"),
                  selectedColor: Constan.primaryColor,
                ),
                SalomonBottomBarItem(
                  icon: Image.asset(Constan.icBook, width: 20, height: 20),
                  activeIcon: Image.asset(Constan.icBook,
                      width: 20, height: 20, color: Constan.primaryColor),
                  title: Text("Book"),
                  selectedColor: Constan.primaryColor,
                ),
                SalomonBottomBarItem(
                  icon: Image.asset(Constan.icScan, width: 20, height: 20),
                  activeIcon: Image.asset(Constan.icScan,
                      width: 20, height: 20, color: Constan.primaryColor),
                  title: Text("Scan"),
                  selectedColor: Constan.primaryColor,
                ),
                SalomonBottomBarItem(
                  icon: Image.asset(Constan.icLocation, width: 20, height: 20),
                  activeIcon: Image.asset(Constan.icLocation,
                      width: 20, height: 20, color: Constan.primaryColor),
                  title: Text("Location"),
                  selectedColor: Constan.primaryColor,
                ),
                SalomonBottomBarItem(
                  icon: Image.asset(Constan.icProfile, width: 20, height: 20),
                  activeIcon: Image.asset(Constan.icProfile,
                      width: 20, height: 20, color: Constan.primaryColor),
                  title: Text("Profile"),
                  selectedColor: Constan.primaryColor,
                ),
              ],
            ),
          ),
        ),
        body: _currentPage,
      ),
    );
  }
}
