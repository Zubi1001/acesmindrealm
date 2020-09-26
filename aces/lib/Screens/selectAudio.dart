import 'package:aces/Objects/session.dart';
import 'package:aces/Screens/selectSubject.dart';
import 'package:aces/Screens/sessionDetails.dart';
import 'package:aces/Screens/tired.dart';
import 'package:audio_picker/audio_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectAudio extends StatefulWidget {
  final Session session;

  const SelectAudio({Key key, this.session}) : super(key: key);
  @override
  _SelectAudioState createState() => _SelectAudioState();
}

enum SoundMode { custom, music, mute }
SoundMode mode;
String audioPath;

class _SelectAudioState extends State<SelectAudio> {
  @override
  Widget build(BuildContext context) {
    var widgetlist = <Widget>[
      SvgPicture.asset("assets/svgs/audioCues.svg",
          height: 50,
          width: 50,
          color: mode == SoundMode.custom ? myPink : Colors.grey[600],
          //color: Colors.white,
          semanticsLabel: 'A red up arrow'),
      SvgPicture.asset("assets/svgs/music.svg",
          height: 50,
          width: 50,
          color: mode == SoundMode.music ? myPink : Colors.grey[600],

          // color: Colors.white,
          semanticsLabel: 'A red up arrow'),
      SvgPicture.asset("assets/svgs/mute.svg",
          height: 50,
          width: 50,
          color: mode == SoundMode.mute ? myPink : Colors.grey[600],
          //color: Colors.white,
          semanticsLabel: 'A red up arrow'),
    ];
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
        child: SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
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
                    "What type of audio would you like?",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              InkWell(
                onTap: () {
                  if (mode == SoundMode.custom) {
                    mode = null;
                  } else {
                    mode = SoundMode.custom;
                  }

                  setState(() {});
                },
                child: Column(
                  children: [
                    widgetlist[0],
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Audio Cues",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              InkWell(
                onTap: () {
                  if (mode == SoundMode.music) {
                    mode = null;
                    setState(() {});
                  } else {
                    AudioPicker.pickAudio().then((value) {
                      if (value.isNotEmpty) {
                        mode = SoundMode.music;
                        audioPath = value;
                      }
                      setState(() {});
                    });
                  }

                  //mode = SoundMode.music;
                },
                child: Column(
                  children: [
                    widgetlist[1],
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Music",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              InkWell(
                onTap: () {
                  if (mode == SoundMode.mute) {
                    mode = null;
                  } else {
                    mode = SoundMode.mute;
                  }
                  //  mode = SoundMode.mute;
                  setState(() {});
                },
                child: Column(
                  children: [
                    widgetlist[2],
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "No Sound",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              mode != null
                  ? Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlatButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => HowTired(
                                        session: widget.session,
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
      ),
    );
  }

  bool selected = false;
  TextEditingController otherPlace = new TextEditingController();
}
