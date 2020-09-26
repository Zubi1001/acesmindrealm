import 'package:aces/Managers/assetManager.dart';
import 'package:aces/Objects/session.dart';
import 'package:aces/Screens/categorySelection.dart';
import 'package:aces/Screens/selectAudio.dart';
import 'package:aces/Screens/sessionDetails.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectSubject extends StatefulWidget {
  final Session session;
  final bool isWork;

  const SelectSubject({Key key, this.session, this.isWork}) : super(key: key);
  @override
  _SelectSubjectState createState() => _SelectSubjectState();
}

class _SelectSubjectState extends State<SelectSubject> {
  Session session;

  String selected = '';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.headset,
              color: Colors.grey[400],
              size: 28,
            ),
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: width * 0.08),
                child: Text(
                  "Let's get started",
                  style: TextStyle(
                    fontSize: 35,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.08),
                child: Text(
                  "What are you ${widget.isWork ? "working on?" : "studying?"}",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.07,
              ),
              Container(
                //height: height * 0.52,
                child: GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  children: List<Widget>.generate(
                    subjects.length,
                    (index) => InkWell(
                      splashColor: Colors.transparent,
                      // highlightColor: Colors.transparent,
                      // focusColor: Colors.transparent,
                      // hoverColor: Colors.transparent,

                      onTap: () {
                        if (selected == subjects[index]) {
                          setState(() {
                            selected = '';
                          });
                        } else {
                          setState(() {
                            selected = subjects[index];
                          });
                        }
                      },
                      child: Container(
                        // height: height*0.1,
                        child: Column(
                          children: [
                            Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: selected == subjects[index]
                                      ? myPink
                                      : Colors.grey[400],
                                  shape: BoxShape.circle,
                                  // borderRadius: BorderRadius.circular(20,),
                                ),
                                child: Center(
                                    child: subjectAssets[subjects[index]])),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Text(
                              subjects[index],
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              selected == "Other"
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                      child: TextField(
                        controller: otherSubject,
                        enableInteractiveSelection: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter text here..."),
                      ),
                    )
                  : Container(),
              SizedBox(
                height: height * 0.03,
              ),
              selected.isNotEmpty
                  ? Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlatButton(
                                onPressed: () {
                                  if (selected == "Other" &&
                                      otherSubject.text.isEmpty) {
                                    scaffoldKey.currentState
                                        .showSnackBar(SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(
                                              "Please enter the task name",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            )));
                                  } else {
                                    session = widget.session;
                                    selected == "Other"
                                        ? session.task = otherSubject.text
                                        : session.task = selected;
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => SelectAudio(
                                          session: session,
                                        ),
                                      ),
                                    );
                                  }
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

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController otherSubject = new TextEditingController();
}
