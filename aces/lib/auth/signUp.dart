import 'package:aces/Objects/user.dart';
import 'package:aces/Screens/sessionDetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Container(
              height: height,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.1,
                    ),
                    CircleAvatar(
                      radius: height * 0.1,
                      backgroundColor: myPink,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/logo.svg",
                              height: height * 0.1,
                              // width: 100,
                              color: Colors.white,
                              semanticsLabel: 'aces logo'),
                          Text(
                            "ACES",
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.1,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Name cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      controller: name,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: myPink,
                          size: 20,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: myPink, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        border: InputBorder.none,
                        hintText: "Name",
                      ),
                    ),
                    Divider(),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Email cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      controller: email,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          FontAwesomeIcons.at,
                          color: myPink,
                          size: 20,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: myPink, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        border: InputBorder.none,
                        hintText: "Email",
                      ),
                    ),
                    Divider(),
                    TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Password cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      controller: password,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          FontAwesomeIcons.lock,
                          color: myPink,
                          size: 20,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: myPink, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        border: InputBorder.none,
                        hintText: "Password",
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Already have an account? Sign In",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: myPink,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Container(
                      width: width * 0.7,
                      height: height * 0.06,
                      child: RaisedButton(
                        elevation: 15,
                        color: Color(0xFFFF6F6F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: email.text, password: password.text)
                                .then((value) {
                              Firestore.instance
                                  .collection('/users')
                                  .document(value.user.uid)
                                  .setData(User(
                                    uid: value.user.uid,
                                    email: email.text,
                                    name: name.text,
                                  ).toJson())
                                  .then((value) {
                                Navigator.of(context).pop();
                              });
                            });
                          }
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: width*0.7,
                      child: Text(
                        "By signing up you agree to the the terms and conditions of ACES By MindRealm",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.1,
                    ),
                    // SizedBox(
                    //   height: height * 0.02,
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
