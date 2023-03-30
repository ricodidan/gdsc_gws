import 'package:flutter/material.dart';
import 'package:gdsc_trash_app/utils/constan.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(16, 4, 16, 80),
          child: Column(
            children: [
              /// Search Section
              Container(
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  onTap: () {},
                  readOnly: true,
                  decoration: InputDecoration(
                      prefixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: null,
                      ),
                      hintText: 'Position, location or keywords..',
                      border: InputBorder.none),
                ),
              ),

              /// Earn Section
              Card(
                color: Constan.sekunderColor,
                margin: EdgeInsets.only(top: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                              ),
                              Image.asset(Constan.icEarningsHome,
                                  width: 30, height: 30)
                            ],
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 4.0),
                              child: Text(
                                "1200",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 2.0),
                              child: Text(
                                "EARNED",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              )),
                        ],
                      ),
                      Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                              ),
                              Image.asset(Constan.icLocationHome,
                                  width: 30, height: 30)
                            ],
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 4.0),
                              child: Text(
                                "7",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 2.0),
                              child: Text(
                                "MARKED",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              )),
                        ],
                      ),
                      Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                              ),
                              Image.asset(Constan.icRecycleHome,
                                  width: 30, height: 30)
                            ],
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 4.0),
                              child: Text(
                                "20",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 2.0),
                              child: Text(
                                "RECYCLED",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),

              /// Waste Categories Section
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Waste Categories",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold)),
                        Spacer(),
                        Text("See All",
                            style: TextStyle(
                                color: Constan.primaryColor,
                                fontSize: 17,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 8.0),
                              width: 140,
                              height: 180,
                              child: Card(
                                color: Color(0xffffcf87),
                                margin: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(4, 8, 4, 0),
                                            child: Text("Organic Waste",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(4, 8, 4, 8),
                                            child: Text(
                                                "Plastic is harming animal and possibly human health",
                                                style: TextStyle(
                                                    color: Colors.black87)),
                                          ),
                                        ])),
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                        child: Image.asset(
                                            Constan.imgOrganicWaste,
                                            width: double.infinity,
                                            fit: BoxFit.fitWidth,
                                            alignment: Alignment.topCenter),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 8.0),
                              width: 140,
                              height: 180,
                              child: Card(
                                color: Color(0xffbcdaff),
                                margin: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(4, 8, 4, 0),
                                            child: Text("Anorganic Waste",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(4, 8, 4, 8),
                                            child: Text(
                                                "Paper causes a lot of green area disappear",
                                                style: TextStyle(
                                                    color: Colors.black87)),
                                          ),
                                        ])),
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                        child: Image.asset(
                                            Constan.imgAnorganicWaste,
                                            width: double.infinity,
                                            fit: BoxFit.fitWidth,
                                            alignment: Alignment.topCenter),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 8.0),
                              width: 140,
                              height: 180,
                              child: Card(
                                color: Color(0xffc9c9c9),
                                margin: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(4, 8, 4, 0),
                                      child: Text("B3 Waste",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(4, 8, 4, 8),
                                      child: Text(
                                          "unwanted chemical,  cause damage to human health or the environment.",
                                          style:
                                              TextStyle(color: Colors.black87)),
                                    ),
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                        child: Image.asset(Constan.imgB3Waste,
                                            width: double.infinity,
                                            fit: BoxFit.fitWidth,
                                            alignment: Alignment.topCenter),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              /// Home Recycle Tips Section
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Home Recycle Tips",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold)),
                        Spacer(),
                        Text("See All",
                            style: TextStyle(
                                color: Constan.primaryColor,
                                fontSize: 17,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8.0),
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Divider(height: 2),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Image.asset(Constan.imgRecycle1,
                                          width: 60,
                                          height: 80,
                                          fit: BoxFit.cover),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  4, 4, 4, 0),
                                              child: Text("Food Waste",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  4, 0, 4, 8),
                                              child: Text(
                                                  "Recycling the food waste to be Bio Gas",
                                                  style: TextStyle(
                                                      color: Colors.black87)),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  4, 8, 4, 8),
                                              child: Text("3 Minutes Reading",
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.black87)),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Divider(height: 2),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Image.asset(Constan.imgRecycle2,
                                          width: 60,
                                          height: 80,
                                          fit: BoxFit.cover),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  4, 4, 4, 0),
                                              child: Text("Paper Waste",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  4, 0, 4, 8),
                                              child: Text(
                                                  "Recycling the paper and protect the nature",
                                                  style: TextStyle(
                                                      color: Colors.black87)),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  4, 8, 4, 8),
                                              child: Text("5 Minutes Reading",
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.black87)),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Divider(height: 2),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Image.asset(Constan.imgRecycle3,
                                          width: 60,
                                          height: 80,
                                          fit: BoxFit.cover),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  4, 4, 4, 0),
                                              child: Text("Plastic Waste",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  4, 0, 4, 8),
                                              child: Text(
                                                  "Let’s we reduce the use of plastic",
                                                  style: TextStyle(
                                                      color: Colors.black87)),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  4, 8, 4, 8),
                                              child: Text("3 Minutes Reading",
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.black87)),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Divider(height: 2),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Image.asset(Constan.imgRecycle4,
                                          width: 60,
                                          height: 80,
                                          fit: BoxFit.cover),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  4, 4, 4, 0),
                                              child: Text("Glass Waste",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  4, 0, 4, 8),
                                              child: Text(
                                                  "Let’s we recycle Glass into Art",
                                                  style: TextStyle(
                                                      color: Colors.black87)),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  4, 8, 4, 8),
                                              child: Text("3 Minutes Reading",
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.black87)),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
