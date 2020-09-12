import 'package:flutter/material.dart';

class PlaceSelection extends StatefulWidget {
  @override
  _PlaceSelectionState createState() => _PlaceSelectionState();
}

class _PlaceSelectionState extends State<PlaceSelection> {
  List<String> places = [
    'Coffee shop',
    'Table',
    'Bed',
    'Office',
    'Library',
    'Living Room',
    'School',
    'Office',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          Icon(
            Icons.headset,
            color: Colors.grey[400],
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            GridView.count(
              crossAxisCount: 3,
              children: List<Widget>.generate(
                  places.length,
                  (index) => Column(
                        children: [
                          Container(
                            child: Placeholder(
                              fallbackHeight: height * 0.01,
                              fallbackWidth: width * 0.06,
                            ),
                          ),
                          SizedBox(
                            height: height*0.05,
                          ),
                          Text(places[index]),
                        ],
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
