import 'package:flutter/material.dart';
import 'package:gdsc_trash_app/utils/constan.dart';

class MyLoading extends StatelessWidget {
  final Color color;

  const MyLoading({Key? key, this.color = Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 3.0,
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
          Container(width: 10),
          Text("Loading...", style: TextStyle(color: color)),
        ],
      ),
    );
  }
}

class MyCircularProgressIndicator extends StatelessWidget {
  const MyCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0),
      height: MediaQuery.of(context).size.width,
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 3.0,
          valueColor: AlwaysStoppedAnimation<Color>(Constan.primaryColor),
        ),
      ),
    );
  }
}

class MyCircularProgressIndicatorSmall extends StatelessWidget {
  final Color color;

  const MyCircularProgressIndicatorSmall(
      {Key? key, this.color = Constan.primaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 30,
        height: 30,
        child: CircularProgressIndicator(
          strokeWidth: 3.0,
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
      ),
    );
  }
}

class MyEmptyDataSmall extends StatelessWidget {
  final String? textEmpty;

  const MyEmptyDataSmall({Key? key, this.textEmpty}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      child: Center(
        child: Container(
          padding: EdgeInsets.all(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5),
              ),
              Text(
                "$textEmpty",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
