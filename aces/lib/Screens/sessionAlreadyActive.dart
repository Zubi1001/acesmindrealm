import 'package:flutter/material.dart';

class SessionAlreadyActive extends StatefulWidget {
  @override
  _SessionAlreadyActiveState createState() => _SessionAlreadyActiveState();
}

class _SessionAlreadyActiveState extends State<SessionAlreadyActive> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: width*0.1
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Placeholder(
              fallbackHeight: height * 0.2,
              fallbackWidth: width * 0.7,
            ),
            SizedBox(
              height: height*0.06,
            ),
            Text(
              "Hey there!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: height*0.03,
            ),
            Text(
              "It seems that you’re already in a session! \n\nPlease end your current one before starting a new one!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
