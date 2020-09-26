import 'package:aces/Objects/session.dart';
import 'package:aces/Screens/SessionVerticalCard.dart';
import 'package:aces/Screens/activeSession.dart';
import 'package:aces/Screens/placeSelection.dart';
import 'package:aces/Screens/sessionDetails.dart';
import 'package:aces/Screens/testValues.dart';
import 'package:aces/auth/authService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'gettingSessionReady.dart';
import 'sessionAlreadyActive.dart';
import 'activeSession.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

var deviceId;

class _DashboardState extends State<Dashboard> {
  FlutterBlue flutterBlue = FlutterBlue.instance;

  getDataFromDatabase() async {
    var querySnapshot =
        await Firestore.instance.collection("/sessions").getDocuments();

    Firestore.instance.collection("/sessions").getDocuments().then((value) {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // flutterBlue.scan().listen((ScanResult scanResult) {
    //   var device = scanResult.device;
    //   var name = device.name;
    //   if (name == 'MindWave Mobile') {
    //     deviceId = device.id.toString();
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        bottomSheet: Container(
          height: 50,
          child: StreamBuilder(
              stream: Stream.value(activeStatus).asBroadcastStream(),
              builder: (context, AsyncSnapshot<AppStatus> status) {
                if (status.hasData) {
                  if (status.data == AppStatus.Active) {
                    return Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: RaisedButton(
                          color: Color(0xFF99E398),
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(
                              builder: (context) => ActiveSession(),
                            ))
                                .then((value) {
                              setState(() {});
                            });
                          },
                          child: Row(
                            children: [
                              Text(
                                "View Active session",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_sharp,
                                color: Colors.white,
                              ),
                              Spacer(),
                              StreamBuilder<int>(
                                stream: stopWatchTimer.rawTime,
                                initialData: 0,
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  final value = snapshot.data;
                                  final displayTime =
                                      StopWatchTimer.getDisplayTime(value);
                                  return Text(
                                    displayTime.substring(
                                        3, displayTime.length - 3),
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontFamily: 'Helvetica',
                                        fontWeight: FontWeight.bold),
                                  );
                                },
                              ),
                            ],
                          ),
                        ));
                  } else {
                    return Container(
                      color: Colors.transparent,
                    );
                  }
                } else {
                  return Container(
                    color: Colors.transparent,
                  );
                }
              }),
        ),
        body: Container(
          width: width,
          height: height,
          child: SingleChildScrollView(
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
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        Icons.person,
                        color: Colors.grey[400],
                        size: 42,
                      ),
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
                          builder: (context) => PlaceSelection(
                            session: Session(),
                          ),
                        ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/homeheader.png",
                              //width: 1000,
                              // height: 1000,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Text(
                                  "Start a New \nSession",
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
                    child: StreamBuilder<QuerySnapshot>(
                        stream: Firestore.instance
                            .collection('/users/${currentUser.uid}/sessions')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                width: width * 0.04,
                              ),
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.documents.length,
                              itemBuilder: (BuildContext context, int index) {
                                Session session = Session.fromJson(
                                    snapshot.data.documents[index].data);
                                return SessionVerticalCard(
                                  session: session,
                                );
                              },
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                  ),
                ),
                // SizedBox(
                //   height: height * 0.02,
                // ),
                Container(
                  width: width * 0.7,
                  height: height * 0.06,
                  child: RaisedButton(
                    elevation: 15,
                    color: Color(0xFFFF6F6F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(
                        builder: (context) => activeStatus == AppStatus.Active
                            ? SessionAlreadyActive()
                            : GettingSessionReady(
                                session: Session(
                                  tiredness: 5,
                                  averageSessionFocus: 0,
                                  durationInSeconds: 0,
                                  highestFocus: 0,
                                  lowestFocus: 0,
                                  place: "Unknown",
                                  rating: 0,
                                  sessionDate: DateTime.now(),
                                  sessionNotes: "",
                                  task: "Unknown",
                                  timeInFlowInSeconds: 0,
                                  timeInFocusInSeconds: 0,
                                ),
                              ),
                      ))
                          .then((value) {
                        setState(() {});
                      });
                    },
                    child: Text(
                      "Start a Quick Session",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: activeStatus == AppStatus.Active ? height * 0.04 : 0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
