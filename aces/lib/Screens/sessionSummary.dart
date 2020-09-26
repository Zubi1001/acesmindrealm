import 'package:aces/Objects/session.dart';
import 'package:aces/Screens/Dashboard.dart';
import 'package:aces/auth/authService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SessionSummary extends StatefulWidget {
  final Session session;
  SessionSummary({this.session});
  @override
  _SessionSummaryState createState() => _SessionSummaryState();
}

class _SessionSummaryState extends State<SessionSummary> {
  Session session;

  @override
  void initState() {
    super.initState();
    session = widget.session;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: InkWell(

        //   child: Icon(Icons.arrow_back_ios)),
        // iconTheme: IconThemeData(
        //   color: Colors.black,
        // ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1),
        child: Column(
          children: [
            Text(
              "Session Summary",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            buildCustomRow(
              string1: "Session Average Focus Level",
              string2: "Your overall average focus:",
              value1: session.averageSessionFocus ?? 63,
              value2: 10,
            ),
            buildCustomRow(
              string1: "Highest Focus Level",
              string2: "your all-time highest:",
              value1: session.highestFocus ?? 76,
              value2: 83,
            ),
            buildCustomRow(
              string1: "Overall Average Focus Level",
              string2: "all-time average:",
              value1: 62,
              value2: 54,
            ),
            singleText(
              value: 23,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            timeRow(
              value: 40,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            InkWell(
              onTap: () {
                var docID = Firestore.instance
                    .collection('/users')
                    .document(currentUser.uid)
                    .collection('sessions')
                    .document()
                    .documentID;

                session.sessionID = docID;
                Firestore.instance
                    .collection('/users')
                    .document(currentUser.uid)
                    .collection('sessions')
                    .document(docID)
                    .setData(session.toJson())
                    .then((value) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => Dashboard(),
                      ),
                      (Route<dynamic> route) => false);
                });
              },
              child: Text(
                "tap here to continue",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget singleText({String string, int value, String sub}) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Text(
            "Lowest Focus Level",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        Spacer(),
        Text(
          session?.lowestFocus?.toString() ?? "5",
          style: TextStyle(
            fontSize: 30,
            color: Colors.red,
          ),
        ),
      ],
    );
  }

  Widget timeRow({String string, int value, String sub}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Text(
            "Time in Session",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              Duration(seconds: session.durationInSeconds).inMinutes.toString(),
              // session?.tiredness?.toString() ?? value.toString(),
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
              ),
            ),
            Text("minutes"),
          ],
        ),
      ],
    );
  }

  Widget buildCustomRow(
      {String string1, int value1, String string2, int value2}) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Text(
                  string1,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Text(
                  string2,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                value1.toString(),
                style: TextStyle(
                  fontSize: 30,
                  color: value1 > value2
                      ? Colors.green
                      : (value2 - value1) < 20 ? Colors.orange : Colors.red,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                value2.toString(),
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
