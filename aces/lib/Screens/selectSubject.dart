import 'package:aces/Screens/categorySelection.dart';
import 'package:aces/Screens/selectAudio.dart';
import 'package:aces/Screens/sessionDetails.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectSubject extends StatefulWidget {
  @override
  _SelectSubjectState createState() => _SelectSubjectState();
}

class _SelectSubjectState extends State<SelectSubject> {
  List<String> subjects = [
    'Biology',
    'Chemistry',
    'Physics',
    'Maths',
    'History',
    'Geography',
    'English',
    'Economics',
    'Other',
  ];

  String selected = '';

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
                  "What are you studying?",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.07,
              ),
              Container(
                height: height * 0.52,
                child: GridView.count(
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
                              decoration: BoxDecoration(
                                color: selected == subjects[index]
                                    ? myPink
                                    : Colors.grey[400],
                                shape: BoxShape.circle,
                                // borderRadius: BorderRadius.circular(20,),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: FaIcon(
                                  FontAwesomeIcons.coffee,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                            ),
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
                        controller: otherPlace,
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
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => SelectAudio(),
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

  TextEditingController otherPlace = new TextEditingController();
}
