import 'package:flutter/material.dart';
import 'package:app/styles/main_style.dart';
import 'package:app/widgets/destination_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<IconData> categoryIcons = [
    Icons.airplanemode_active,
    Icons.business,
    Icons.child_care,
    Icons.school,
  ];
  int selectedIndex = 0;

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 21.0),
        child: Container(
          decoration: BoxDecoration(
            color: selectedIndex == index
                ? Theme.of(context).accentColor
                : buttonBackGrey,
            shape: BoxShape.circle,
          ),
          width: 60.0,
          height: 60.0,
          child: Icon(
            categoryIcons[index],
            color: selectedIndex == index
                ? Theme.of(context).primaryColor
                : iconButtonGrey,
            size: 25.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text('What would you like to find?', style: mainDisplay),
            ),
            Container(
              height: 120.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryIcons.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildIcon(index);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Top Destinations', style: display1),
                  Text('See All', style: linkText),
                ],
              ),
            ),
            DestinationCarousel()
          ],
        ),
      ),
    );
  }
}
