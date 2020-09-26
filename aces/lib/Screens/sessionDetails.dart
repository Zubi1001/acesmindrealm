import 'package:aces/Objects/session.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class SessionDetails extends StatefulWidget {
  final Session session;
  SessionDetails({this.session});
  @override
  _SessionDetailsState createState() => _SessionDetailsState();
}

class _SessionDetailsState extends State<SessionDetails> {
  Session session;

  @override
  void initState() {
    super.initState();
    session = widget.session;
    // session = getDummySession();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: width,
              height: height * 0.5,
              color: myPink,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.12,
                    ),
                    Text(
                      DateFormat.yMMMd().format(session.sessionDate),
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(
                      (session.durationInSeconds / 60).toString() + " minutes",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Text(
                      "At a ${session.place}",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      children: [
                        Spacer(),
                        Placeholder(
                          fallbackHeight: height * 0.1,
                          fallbackWidth: width * 0.3,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: height * 0.2,
                  child: ratingCard(context),
                ),
                Container(
                  height: height * 0.2,
                  child: tirednessCard(context),
                ),
                Container(
                  height: height * 0.2,
                  child: timeInFlowCard(context),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.05),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Session Notes",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.05),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  session.sessionNotes,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ratingCard(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {},
      child: Container(
        // height: MediaQuery.of(context).size.height * 0.23,
        width: MediaQuery.of(context).size.width * 0.30,
        decoration: BoxDecoration(),
        // constraints: BoxConstraints(
        //     maxHeight: MediaQuery.of(context).size.height * 0.23),
        child: Card(
          // margin: EdgeInsets.only(
          //   bottom: MediaQuery.of(context).size.height * 0.05,
          // ),
          color: Color(0xFF262B46),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 15,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Rating",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Container(
                  child: SmoothStarRating(
                      allowHalfRating: false,
                      onRated: (v) {
                        print(v);
                      },
                      // defaultIconData: Icon(ICons),
                      starCount: 5,
                      rating: 1.0,
                      size: width * 0.04,
                      isReadOnly: true,
                      // fullRatedIconData: Icons.blur_off,
                      // halfRatedIconData: Icons.blur_on,
                      color: Colors.white,
                      borderColor: Colors.white,
                      spacing: 0.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget tirednessCard(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {},
      child: Container(
        // height: MediaQuery.of(context).size.height * 0.23,
        width: MediaQuery.of(context).size.width * 0.30,
        decoration: BoxDecoration(),
        // constraints: BoxConstraints(
        //     maxHeight: MediaQuery.of(context).size.height * 0.23),
        child: Card(
          // margin: EdgeInsets.only(
          //   bottom: MediaQuery.of(context).size.height * 0.05,
          // ),
          color: Color(0xFF262B46),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 15,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Tiredness",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Container(
                  child: Text(
                    session.tiredness.toString(),
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                // Align(
                //   alignment: Alignment.centerRight,
                //   child: Icon(
                //     Icons.arrow_right_alt_outlined,
                //     color: Colors.white,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget timeInFlowCard(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width * 0.30,
        decoration: BoxDecoration(),
        child: Card(
          color: Color(0xFF262B46),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 15,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Time in Flow",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Container(
                  child: Text(
                    Duration(seconds: session.timeInFlowInSeconds)
                        .inMinutes
                        .toString(),
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  "minutes",
                  style: TextStyle(
                    fontSize: 11,
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

Color myPink = Color(0xFFFF6F6F);
