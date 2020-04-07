import 'package:app/models/destination_model.dart';
import 'package:flutter/material.dart';
import 'package:app/styles/main_style.dart';
import 'package:app/screens/info_screen.dart';

class DestinationCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      height: 300.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: destinations.length,
        itemBuilder: (BuildContext context, int index) {
          Destination destination = destinations[index];
          return Container(
            width: 180.0,
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 135.0,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: 180.0,
                        height: 120.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0.0, 15.0),
                              blurRadius: 20.0,
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                      ),
                      Positioned(
                        top: 40,
                        left: 10,
                        child: Text('125 activities', style: smallHead),
                      ),
                      Positioned(
                        top: 68,
                        left: 12,
                        child: Container(
                          width: 160.0,
                          child:
                              Text(destination.description, style: smallMuted),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InfoScreen(destination)),
                    );
                  },
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Stack(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(destination.imageUrl),
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
                              height: 160.0,
                              width: 160.0,
                            ),
                            Container(
                              height: 160.0,
                              width: 160.0,
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
                            )
                          ],
                        ),
                        Positioned(
                          bottom: 28,
                          left: 10,
                          child: Text(destination.city, style: display2White),
                        ),
                        Positioned(
                          bottom: 12,
                          left: 10,
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                size: 13.0,
                                color: Colors.white54,
                              ),
                              SizedBox(width: 3.0),
                              Text(destination.country, style: subTextCard),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
