import 'package:aces/Objects/session.dart';
import 'package:aces/Screens/selectSubject.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectCategory extends StatefulWidget {
  final Session session;

  const SelectCategory({Key key, this.session}) : super(key: key);
  @override
  _SelectCategoryState createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  Session session;
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
                    "Are you studying or working?",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.1,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SelectSubject(
                      isWork: false,
                      session: widget.session,
                    ),
                  ));
                },
                child: SvgPicture.asset("assets/svgs/studying.svg",
                    //height: 30,
                    //width: 30,
                    // color: Colors.white,
                    semanticsLabel: 'A red up arrow'),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Studying",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward),
                ],
              ),
              SizedBox(
                height: height * 0.05,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SelectSubject(
                      isWork: true,
                      session: widget.session,
                    ),
                  ));
                },
                child: SvgPicture.asset("assets/svgs/workingMan.svg",
                    //height: 30,
                    //width: 30,
                    // color: Colors.white,
                    semanticsLabel: 'A red up arrow'),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Working",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextEditingController otherPlace = new TextEditingController();
}
