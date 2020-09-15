import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ActiveSession extends StatefulWidget {
  @override
  _ActiveSessionState createState() => _ActiveSessionState();
}

class _ActiveSessionState extends State<ActiveSession> {
  Color myColor = Color(0xCF2A2A);
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
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .45,),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(40),
              ),
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
                            Text(
                              "23:12",
                              style: TextStyle(fontSize: 18),
                            ),
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
                              FaIcon(FontAwesomeIcons.signal,size:15)
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
                                  "6",
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
                                Icon(
                                  Icons.library_books,
                                  size: 35,
                                  color: Colors.grey[600],
                                ),
                                // FaIcon(FontAwesomeIcons.bookOpen),
                                SizedBox(height: 6),
                                Text("Library",
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
                                FaIcon(
                                  FontAwesomeIcons.flask,
                                  size: 30,
                                  color: Colors.grey[600],
                                ),
                                SizedBox(height: 6),
                                Text("Chemistry",
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
                    Center(
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * .065,
                        width: MediaQuery.of(context).size.width * .6,
                        decoration: BoxDecoration(
                          color: Colors.red[700],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            "End Session",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}