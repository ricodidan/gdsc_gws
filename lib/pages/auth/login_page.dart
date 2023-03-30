import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gdsc_trash_app/pages/home/menu_page.dart';
import 'package:gdsc_trash_app/utils/constan.dart';
import 'package:gdsc_trash_app/utils/helper.dart';
import 'package:gdsc_trash_app/widget/loading_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final keyformregister = GlobalKey<FormState>();
  final keyformlogin = GlobalKey<FormState>();
  bool passwordVisible = true;
  bool passwordVisibleLogin = true;

  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtEmailLogin = TextEditingController();
  TextEditingController txtPasswordLogin = TextEditingController();

  String? email;
  String? password;
  String? emailLogin;
  String? passwordLogin;

  bool isLoading = false;
  bool isLoadingLoading = false;
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode emailFocusLogin = FocusNode();
  final FocusNode passwordFocusLogin = FocusNode();

  DateTime? currentBackPressTime;

  @override
  void initState() {
    super.initState();
    removeAllShareName();
  }

  void actionPostLogin() async {
    if (keyformlogin.currentState!.validate()) {
      keyformlogin.currentState!.save();

      Helper.pushReplacementPage(context, MenuPage());
    }
  }

  void actionPostRegister() async {
    if (keyformregister.currentState!.validate()) {
      keyformregister.currentState!.save();

      // Helper.pushReplacementPage(context, MenuPage());
    }
  }

  startLoading() {
    setState(() {
      isLoading = true;
    });
  }

  stopLoading() {
    setState(() {
      isLoading = false;
    });
  }

  fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  Future<bool> onWillPop() {
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
        body: SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              color: Colors.white,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(16, 32, 16, 32),
                    child: Hero(
                      tag: "imglogo",
                      child: Image.asset(Constan.imgLogo,
                          width: 120, fit: BoxFit.contain),
                    ),
                  ),
                  Expanded(
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  width: 2, color: Colors.grey.shade300),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                            ),
                            child: SegmentedTabControl(
                              backgroundColor: Colors.grey.shade300,
                              indicatorColor: Colors.white,
                              tabTextColor: Colors.black,
                              radius: Radius.circular(10.0),
                              height: 30,
                              tabs: [
                                SegmentTab(
                                    label: "Register",
                                    selectedTextColor: Colors.black),
                                SegmentTab(
                                    label: "Login",
                                    selectedTextColor: Colors.black),
                              ],
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                //register
                                SingleChildScrollView(
                                  child: Container(
                                    padding:
                                        EdgeInsets.fromLTRB(16, 20, 16, 16),
                                    child: Form(
                                        key: keyformregister,
                                        autovalidateMode:
                                            AutovalidateMode.always,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 3),
                                              child: TextFormField(
                                                controller: txtEmail,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "* Email is required";
                                                  }
                                                  return null;
                                                },
                                                onSaved: (newValue) {
                                                  email = newValue;
                                                },
                                                textInputAction:
                                                    TextInputAction.next,
                                                focusNode: emailFocus,
                                                onFieldSubmitted: (value) {
                                                  fieldFocusChange(
                                                      context,
                                                      emailFocus,
                                                      passwordFocus);
                                                },
                                                maxLength: 70,
                                                decoration: InputDecoration(
                                                  hintText: "Email",
                                                  filled: true,
                                                  counterText: "",
                                                  // contentPadding:  EdgeInsets.symmetric(
                                                  //     horizontal: 10, vertical: 5),
                                                  // border: OutlineInputBorder(
                                                  //     borderSide:  BorderSide(width: 1),
                                                  //     borderRadius:
                                                  //         BorderRadius.circular(15)),
                                                  // prefixIcon: Icon(
                                                  //     Icons.person_outline)
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 15, bottom: 7),
                                              child: TextFormField(
                                                controller: txtPassword,
                                                obscureText: passwordVisible,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "* Password is required";
                                                  }
                                                  return null;
                                                },
                                                onSaved: (newValue) {
                                                  password = newValue;
                                                },
                                                maxLength: 50,
                                                focusNode: passwordFocus,
                                                textInputAction:
                                                    TextInputAction.done,
                                                decoration: InputDecoration(
                                                    hintText: "Password",
                                                    filled: true,
                                                    counterText: "",
                                                    // contentPadding:  EdgeInsets.symmetric(
                                                    //     horizontal: 10, vertical: 5),
                                                    // border: OutlineInputBorder(
                                                    //     borderSide:  BorderSide(width: 1),
                                                    //     borderRadius:
                                                    //         BorderRadius.circular(15)),
                                                    // prefixIcon: Icon(Icons.lock),
                                                    suffixIcon: IconButton(
                                                        icon: Icon(passwordVisible
                                                            ? Icons.visibility
                                                            : Icons
                                                                .visibility_off),
                                                        onPressed: () {
                                                          setState(() {
                                                            passwordVisible =
                                                                !passwordVisible;
                                                          });
                                                        })),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 25, bottom: 25),
                                              child: SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: FloatingActionButton
                                                    .extended(
                                                        heroTag: "herologin",
                                                        onPressed: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          actionPostRegister();
                                                        },
                                                        backgroundColor: Constan
                                                            .primaryColor,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8)),
                                                        label:
                                                            isLoading == false
                                                                ? Text(
                                                                    "Sign Up",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  )
                                                                : MyLoading()),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Row(
                                                children: [
                                                  Text(
                                                      "By signing up, you accept our "),
                                                  Text(
                                                    "conditions",
                                                    style: TextStyle(
                                                        color: Constan
                                                            .sekunderColor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 8),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Row(
                                                children: [
                                                  Text("Have an account ? "),
                                                  Text(
                                                    "Login",
                                                    style: TextStyle(
                                                        color: Constan
                                                            .sekunderColor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                ),
                                //login
                                SingleChildScrollView(
                                  child: Container(
                                    padding:
                                        EdgeInsets.fromLTRB(16, 20, 16, 16),
                                    child: Form(
                                        key: keyformlogin,
                                        autovalidateMode:
                                            AutovalidateMode.always,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 3),
                                              child: TextFormField(
                                                controller: txtEmailLogin,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "* Email is required";
                                                  }
                                                  return null;
                                                },
                                                onSaved: (newValue) {
                                                  emailLogin = newValue;
                                                },
                                                textInputAction:
                                                    TextInputAction.next,
                                                focusNode: emailFocusLogin,
                                                onFieldSubmitted: (value) {
                                                  fieldFocusChange(
                                                      context,
                                                      emailFocusLogin,
                                                      passwordFocusLogin);
                                                },
                                                maxLength: 70,
                                                decoration: InputDecoration(
                                                  hintText: "Email",
                                                  filled: true,
                                                  counterText: "",
                                                  // contentPadding:  EdgeInsets.symmetric(
                                                  //     horizontal: 10, vertical: 5),
                                                  // border: OutlineInputBorder(
                                                  //     borderSide:  BorderSide(width: 1),
                                                  //     borderRadius:
                                                  //         BorderRadius.circular(15)),
                                                  // prefixIcon: Icon(
                                                  //     Icons.person_outline)
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 15, bottom: 7),
                                              child: TextFormField(
                                                controller: txtPasswordLogin,
                                                obscureText:
                                                    passwordVisibleLogin,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "* Password is required";
                                                  }
                                                  return null;
                                                },
                                                onSaved: (newValue) {
                                                  passwordLogin = newValue;
                                                },
                                                maxLength: 50,
                                                focusNode: passwordFocusLogin,
                                                textInputAction:
                                                    TextInputAction.done,
                                                decoration: InputDecoration(
                                                    hintText: "Password",
                                                    filled: true,
                                                    counterText: "",
                                                    // contentPadding:  EdgeInsets.symmetric(
                                                    //     horizontal: 10, vertical: 5),
                                                    // border: OutlineInputBorder(
                                                    //     borderSide:  BorderSide(width: 1),
                                                    //     borderRadius:
                                                    //         BorderRadius.circular(15)),
                                                    // prefixIcon: Icon(Icons.lock),
                                                    suffixIcon: IconButton(
                                                        icon: Icon(
                                                            passwordVisibleLogin
                                                                ? Icons
                                                                    .visibility
                                                                : Icons
                                                                    .visibility_off),
                                                        onPressed: () {
                                                          setState(() {
                                                            passwordVisibleLogin =
                                                                !passwordVisibleLogin;
                                                          });
                                                        })),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 25, bottom: 25),
                                              child: SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: FloatingActionButton
                                                    .extended(
                                                        heroTag: "herologin",
                                                        onPressed: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          actionPostLogin();
                                                        },
                                                        backgroundColor: Constan
                                                            .primaryColor,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8)),
                                                        label:
                                                            isLoading == false
                                                                ? Text(
                                                                    "Sign In",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  )
                                                                : MyLoading()),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Row(
                                                children: [
                                                  Text("Forgot Password ? "),
                                                  Text(
                                                    "Remember",
                                                    style: TextStyle(
                                                        color: Constan
                                                            .sekunderColor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 8),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Row(
                                                children: [
                                                  Text(
                                                      "Don't have an account ? "),
                                                  Text(
                                                    "Register",
                                                    style: TextStyle(
                                                        color: Constan
                                                            .sekunderColor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
