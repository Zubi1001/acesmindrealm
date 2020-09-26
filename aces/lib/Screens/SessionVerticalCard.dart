
import 'package:aces/Objects/session.dart';
import 'package:aces/Screens/sessionDetails.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SessionVerticalCard extends StatelessWidget {
  final Session session;

  SessionVerticalCard({this.session});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SessionDetails(session: session,),
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
                        session?.sessionDate ?? DateTime.now(),
                      )
                      .substring(
                        0,
                        DateFormat.yMMMd()
                            .format(
                              session?.sessionDate ?? DateTime.now(),
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
