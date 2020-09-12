import 'package:aces/Objects/session.dart';
import 'package:aces/Screens/placeSelection.dart';
import 'package:aces/Screens/sessionDetails.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: width,
          height: height,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.04,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width * 0.07,
                  ),
                  Icon(
                    Icons.headset,
                    color: Colors.grey[400],
                    size: 42,
                  ),
                  Spacer(),
                  CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  SizedBox(
                    width: width * 0.07,
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Text(
                "Productivity",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                "____",
                style: TextStyle(
                  color: Color(0xFFFF6F6F),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Container(
                height: height * 0.23,
                width: width * 0.9,
                //            decoration: BoxDecoration(
                //   boxShadow: [
                //     BoxShadow(
                //       blurRadius: 1,
                //       color: Colors.black.withOpacity(0.3),
                //       offset: Offset(0,0),
                //       spreadRadius: 1,
                //     ),
                //   ]
                // ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                  elevation: 15,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PlaceSelection(),
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.all(width * 0.03),
                            child: Placeholder(),
                          )),
                          Expanded(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Text(
                                  "Start a New Session",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                Spacer(),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                    Icons.arrow_right,
                                    color: Color(0xFFFF6F6F),
                                    size: 48,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.07),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Browse Past Sessions",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Container(
                height: height * 0.25,
                child: Padding(
                  padding: EdgeInsets.only(left: width * 0.07),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      width: width * 0.08,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return SessionVerticalCard();
                    },
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Container(
                width: width * 0.7,
                height: height * 0.06,
                child: RaisedButton(
                  elevation: 15,
                  color: Color(0xFFFF6F6F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Start a Quick Session",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SessionVerticalCard extends StatelessWidget {
  final Session session;

  SessionVerticalCard({this.session});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SessionDetails(),
        ));
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.23,
        width: MediaQuery.of(context).size.width * 0.30,
        decoration: BoxDecoration(),
        constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.23),
        child: Card(
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height * 0.05,
          ),
          color: Color(0xFF262B46),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 15,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  DateFormat.yMMMd()
                      .format(
                        session?.startTime ?? DateTime.now(),
                      )
                      .substring(
                        0,
                        DateFormat.yMMMd()
                            .format(
                              session?.startTime ?? DateTime.now(),
                            )
                            .indexOf(','),
                      ),
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  session?.place ?? "Random Place",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Placeholder(
                        color: Colors.white,
                        fallbackWidth: 20,
                        fallbackHeight: 20,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.arrow_right_alt_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
