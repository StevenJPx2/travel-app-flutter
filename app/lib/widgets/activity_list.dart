import 'package:flutter/material.dart';
import 'package:app/models/activity_model.dart';
import 'package:app/styles/main_style.dart';

class ActivityWidget extends StatefulWidget {
  final Activity activity;

  ActivityWidget(this.activity);

  @override
  _ActivityWidgetState createState() => _ActivityWidgetState();
}

class _ActivityWidgetState extends State<ActivityWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      height: 200.0,
      width: MediaQuery.of(context).size.width * 0.90,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: Stack(
              children: <Widget>[
                Container(
                  height: 200.0,
                  width: MediaQuery.of(context).size.width * 0.85,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 10.0),
                        blurRadius: 20.0,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  // left: 100.0,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    color: Colors.green,
                    height: 120.0,
                    child: Column(
                      children: <Widget>[
                        Text(
                          widget.activity.name,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          widget.activity.type,
                          style: TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    image: DecorationImage(
                      image: AssetImage(widget.activity.imageUrl),
                      repeat: ImageRepeat.noRepeat,
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 10.0),
                        blurRadius: 20.0,
                      ),
                    ],
                  ),
                  height: 180.0,
                  width: 110.0,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 180.0,
                  width: 110.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.grey.withOpacity(0.0),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
