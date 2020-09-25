import 'package:aces/Screens/Dashboard.dart';
import 'package:aces/auth/signIn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
        if (snapshot.hasData) {
          return StreamBuilder<DocumentSnapshot>(
              stream: Firestore.instance
                  .collection('/users')
                  .document(snapshot.data.uid)
                  .snapshots(),
              builder: (context, docsnapshot) {
                if (docsnapshot.hasData) {
                  if (docsnapshot.data.exists) {
                    return Dashboard();
                  } else {
                    return Container(
                      child: Center(
                          child: Text(
                              "There was an error, Please restart the app.")),
                    );
                  }
                } else {
                  return Container(
                    child: Center(
                        child: Text(
                            "There was an error, Please restart the app.")),
                  );
                }
              });
        } else {
          return SignIn();
        }
      },
    );
  }
}
