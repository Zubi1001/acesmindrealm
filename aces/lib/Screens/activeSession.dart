import 'package:aces/Managers/assetManager.dart';
import 'package:aces/Objects/session.dart';
import 'package:aces/Screens/Dashboard.dart';
import 'package:aces/Screens/selectAudio.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'sessionSummary.dart';

class ActiveSession extends StatefulWidget {
  final Session session;

  const ActiveSession({Key key, this.session}) : super(key: key);
  @override
  _ActiveSessionState createState() => _ActiveSessionState();
}

StopWatchTimer stopWatchTimer;

int activeSeconds = 0;
AppStatus activeStatus = AppStatus.Inactive;
enum AppStatus { Active, Inactive }

class _ActiveSessionState extends State<ActiveSession> {
  Session session;
  TextEditingController sessionNotes = new TextEditingController();

  @override
  void initState() {
    super.initState();
    session = widget.session;
    
    //print(stopWatchTimer.isRunning);
    if (activeStatus == AppStatus.Active) {
      stopWatchTimer.setPresetSecondTime(activeSeconds);
      stopWatchTimer.onExecute.add(StopWatchExecute.start);
    } else {
      stopWatchTimer = StopWatchTimer(
        onChangeRawSecond: (int secs) {
          activeSeconds = secs;
        },
      );
      activeStatus = AppStatus.Active;
      stopWatchTimer.onExecute.add(StopWatchExecute.start);
      if(mode==SoundMode.music && audioPath.isNotEmpty){
        player.play(audioPath, stayAwake: true);
        player.setReleaseMode(ReleaseMode.LOOP);
      }else if(mode==SoundMode.custom){
         player.play(audioCueTrack, stayAwake: true);
        player.setReleaseMode(ReleaseMode.LOOP);
      }
    }
  }

  @override
  void dispose() async {
    super.dispose();
    //await stopWatchTimer.dispose(); // Need to call dispose function.
  }

  Color myColor = Color(0xFFCF2A2A);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            child: Container(
              //   color: Colors.deepPurple,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/table.jpg"),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .55,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 60, 0, 0),
                  child: Container(
                    // padding:  const EdgeInsets.fromLTRB(30, 50, 0, 0),
                    alignment: Alignment.topLeft,

                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white),
                        ),
                        child: Center(
                            child: Icon(Icons.keyboard_arrow_left,
                                color: Colors.white, size: 30))),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(40),
              ),
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.fromLTRB(25, 30, 25, 10),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .55,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Spacer(),
                          Column(
                            children: [
                              Text(
                                "Time in session :",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 7),
                              StreamBuilder<int>(
                                stream: stopWatchTimer.rawTime,
                                initialData: 0,
                                builder: (context, snap) {
                                  final value = snap.data;
                                  final displayTime =
                                      StopWatchTimer.getDisplayTime(value);
                                  return Text(
                                    displayTime.substring(3),
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Helvetica',
                                        fontWeight: FontWeight.bold),
                                  );
                                },
                              ),
                              // Text(
                              //   "23:12",
                              //   style: TextStyle(fontSize: 18),
                              // ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.headset,
                                  size: 25,
                                  color: Colors.blueAccent[600],
                                ),
                                FaIcon(FontAwesomeIcons.signal, size: 15)
                                // Icon(Icons.signal_cellular_4_bar,
                                //     color: Colors.blueGrey, size: 25)
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .05),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            // height: MediaQuery.of(context).size.height * .1,
                            width: MediaQuery.of(context).size.width * .2,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Spacer(),
                                  Text(
                                    widget.session?.tiredness?.toString() ??
                                        "?",
                                    style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey[600]),
                                  ),
                                  Text("Tiredness",
                                      style: TextStyle(fontSize: 10)),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * .1,
                            width: MediaQuery.of(context).size.width * .2,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Spacer(),
                                  placesAssetsMiniBlack[widget.session?.place] ??
                                      placesAssetsMiniBlack['Other'],
                                  // FaIcon(FontAwesomeIcons.bookOpen),
                                  SizedBox(height: 6),
                                  Text(widget.session?.place ?? "Unknown",
                                      style: TextStyle(fontSize: 10)),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * .1,
                            width: MediaQuery.of(context).size.width * .2,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Spacer(),
                                  subjectAssetsMiniBlack[widget.session.task] ??
                                      subjectAssetsMiniBlack['Other'],
                                  SizedBox(height: 6),
                                  Text(widget.session.task ?? "Unknown",
                                      style: TextStyle(fontSize: 10)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Text(
                        "Session Notes :",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500),
                      ),
                      TextField(
                        controller: sessionNotes,
                        maxLines: 4,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: "Enter text",
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding:
                              EdgeInsets.only(bottom: 11, top: 11, right: 15),
                        ),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Spacer(),
                          Center(
                            child: InkWell(
                              onTap: () {
                                activeStatus = AppStatus.Inactive;
                                session = widget.session;
                                session.durationInSeconds = activeSeconds;
                                session.sessionNotes = sessionNotes.text;
                                activeSeconds = 0;

                                stopWatchTimer.onExecute
                                    .add(StopWatchExecute.stop);
                                setState(() {});
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (context) => SessionSummary(
                                    session: session,
                                  ),
                                ));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height:
                                    MediaQuery.of(context).size.height * .065,
                                width: MediaQuery.of(context).size.width * .6,
                                decoration: BoxDecoration(
                                  color: myColor,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Text(
                                    "End Session",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // ClipRRect(
                          //   borderRadius: BorderRadius.circular(20),
                          //   child: IconButton(
                          //     onPressed: sessionPlaying
                          //         ? () {
                          //             stopWatchTimer.onExecute
                          //                 .add(StopWatchExecute.stop);
                          //             setState(() {
                          //               sessionPlaying = false;
                          //             });
                          //           }
                          //         : () {
                          //             stopWatchTimer.onExecute
                          //                 .add(StopWatchExecute.start);
                          //             setState(() {
                          //               sessionPlaying = true;
                          //             });
                          //           },
                          //     icon: sessionPlaying
                          //         ? Icon(
                          //             Icons.pause,
                          //             color: myColor,
                          //           )
                          //         : Icon(
                          //             Icons.play_arrow,
                          //             color: myColor,
                          //           ),
                          //   ),
                          //   // label: Text("Pause")),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool sessionPlaying = true;
}
