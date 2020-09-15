import 'package:aces/Screens/selectSubject.dart';
import 'package:flutter/material.dart';

class SelectCategory extends StatefulWidget {
  @override
  _SelectCategoryState createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
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
                height: height * 0.07,
              ),
              Placeholder(
                fallbackHeight: height * 0.2,
                fallbackWidth: width * 0.3,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Studying",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SelectSubject(),
                  ));
                },
                child: Placeholder(
                  fallbackHeight: height * 0.2,
                  fallbackWidth: width * 0.3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Working",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextEditingController otherPlace = new TextEditingController();
}
