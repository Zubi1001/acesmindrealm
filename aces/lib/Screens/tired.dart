import 'package:aces/Objects/session.dart';
import 'package:aces/Screens/activeSession.dart';
import 'package:aces/Screens/gettingSessionReady.dart';
import 'package:aces/Screens/selectAudio.dart';
import 'package:aces/Screens/sessionDetails.dart';
import 'package:flutter/material.dart';

class HowTired extends StatefulWidget {
  final Session session;

  const HowTired({Key key, this.session}) : super(key: key);
  @override
  _HowTiredState createState() => _HowTiredState();
}

class _HowTiredState extends State<HowTired> {
  Session session;
  double tiredSlider = 0;
  int tired = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: width * 0.08),
                child: Text(
                  "Let's get started",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.023,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: width * 0.08),
                child: Text(
                  "How tired are you?",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.3,
            ),
            // Spacer(),
            Slider.adaptive(
              value: tiredSlider,
              activeColor: myPink,
              label: tired.toString(),
              divisions: 10,
              inactiveColor: Colors.grey,
              onChanged: (value) {
                tired = (value * 10).toInt();
                // print(tired);
                setState(() {
                  tiredSlider = value;
                });
              },
            ),
            Spacer(),
            tired > 0
                ? Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FlatButton(
                              onPressed: () {
                                session=widget.session;
                                session.tiredness=tired;
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => GettingSessionReady(
                                      session: session,
                                    ),
                                  ),
                                );
                              },

                              // icon: Icon(
                              //   Icons.arrow_right,
                              // ),
                              child: Text(
                                "Next",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              )),
                          Icon(
                            Icons.arrow_forward,
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  bool selected = false;
  TextEditingController otherPlace = new TextEditingController();
}
