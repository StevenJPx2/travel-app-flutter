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
  Widget _buildTimeCon(String time) {
    return Container(
      margin: EdgeInsets.only(right: 5.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: Color(0xFFE1F3F4),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Text(
        time,
        style: TextStyle(fontSize: 12.0),
      ),
    );
  }

  Widget _buildStar(bool isFull) {
    return Icon(
      Icons.star,
      size: 10.0,
      color: isFull ? Colors.amber : Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
      height: 160.0,
      width: MediaQuery.of(context).size.width * 0.90,
      child: Stack(
        children: <Widget>[
          Positioned(
            right: 0,
            child: Stack(
              children: <Widget>[
                Container(
                  height: 160.0,
                  width: MediaQuery.of(context).size.width * 0.85,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
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
                  top: 25.0,
                  left: 100.0,
                  child: SizedBox(
                    width: 140.0,
                    height: 40.0,
                    child: Text(
                      widget.activity.name,
                      style: TextStyle(
                        height: 0.95,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
                Positioned(
                  top: 65.0,
                  left: 100.0,
                  child: Text(
                    widget.activity.type,
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                      color: iconButtonGrey,
                    ),
                  ),
                ),
                Positioned(
                  top: 85.0,
                  left: 100.0,
                  child: Row(
                    children: List.generate(
                            5, (int index) => index <= widget.activity.rating)
                        .asMap()
                        .entries
                        .map((MapEntry map) => _buildStar(map.value))
                        .toList(),
                  ),
                ),
                Positioned(
                  top: 105.0,
                  left: 100.0,
                  child: Row(
                    children: widget.activity.startTimes
                        .asMap()
                        .entries
                        .map((MapEntry map) => _buildTimeCon(map.value))
                        .toList(),
                  ),
                ),
                Positioned(
                  top: 21.0,
                  right: 20.0,
                  child: Text(
                    "\$" + widget.activity.price.toString(),
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: 47.0,
                  right: 20.0,
                  child: Text(
                    "per pax",
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w400,
                      color: iconButtonGrey,
                    ),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
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
              height: 140.0,
              width: 110.0,
            ),
          ),
        ],
      ),
    );
  }
}
