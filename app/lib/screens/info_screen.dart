import 'package:app/models/destination_model.dart';
import 'package:app/widgets/activity_list.dart';
import 'package:flutter/material.dart';
import 'package:app/styles/main_style.dart';

class InfoScreen extends StatefulWidget {
  final Destination destination;

  InfoScreen(this.destination);
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      image: DecorationImage(
                        image: AssetImage(widget.destination.imageUrl),
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
                    height: MediaQuery.of(context).size.height * 0.45,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.45,
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
                bottom: 58,
                left: 15,
                child: Text(widget.destination.city, style: display2WhiteLarge),
              ),
              Positioned(
                width: MediaQuery.of(context).size.width * 0.95,
                bottom: 22,
                left: 15,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      size: 20.0,
                      color: Colors.white54,
                    ),
                    SizedBox(width: 3.0),
                    Text(widget.destination.country, style: subTextCardLarge),
                    Spacer(),
                    IconButton(
                      icon: Icon(
                        Icons.add_location,
                        color: Colors.white54,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
          ActivityWidget(activities[0]),
        ],
      ),
    );
  }
}
