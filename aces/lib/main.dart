import 'package:aces/Screens/Dashboard.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

FirebaseAnalytics analytics;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Crashlytics.instance.enableInDevMode =
      false; // turn this off after seeing reports in in the console.
  FlutterError.onError = Crashlytics.instance.recordFlutterError;
  analytics = FirebaseAnalytics();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(
              color: Color(0xFF333844),
            ),
            elevation: 0,
            actionsIconTheme: IconThemeData(
              color: Color(0xFFC4C4C4),
            )),
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Dashboard(),
    );
  }
}
