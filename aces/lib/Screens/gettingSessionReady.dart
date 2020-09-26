import 'package:aces/Objects/session.dart';
import 'package:aces/Screens/activeSession.dart';
import 'package:flutter/material.dart';

Session currentlyActiveSession;

class GettingSessionReady extends StatefulWidget {
  final Session session;

  const GettingSessionReady({Key key, this.session}) : super(key: key);
  @override
  _GettingSessionReadyState createState() => _GettingSessionReadyState();
}

class _GettingSessionReadyState extends State<GettingSessionReady> {
  AssetImage image;
  @override
  void initState() {
    super.initState();
    currentlyActiveSession=widget.session;
    image = AssetImage("assets/countdown.gif");
    Future.delayed(Duration(seconds: 8)).then((value) {
      if (mounted) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ActiveSession(
            session: widget.session,
          ),
        ));
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    image.evict();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.arrow_back_ios),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: image,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Text(
            "Getting your session ready!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
