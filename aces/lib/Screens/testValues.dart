// import 'package:aces/Screens/Dashboard.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_mindwave_mobile_2/flutter_mindwave_mobile_2.dart';
// import 'package:flutter_blue/flutter_blue.dart';
// class TestValues extends StatefulWidget {
//   @override
//   _TestValuesState createState() => _TestValuesState();
// }

// class _TestValuesState extends State<TestValues> {
//   FlutterMindWaveMobile2 flutterMindWaveMobile2 = FlutterMindWaveMobile2();

//   var connectionSubscription;
//   FlutterBlue flutterBlue = FlutterBlue.instance;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

    
//     flutterBlue
//     .scan()
//     .listen((ScanResult scanResult) {
//         var device = scanResult.device;
//         var name = device.name;
//         if (name == 'MindWave Mobile') {
//             var deviceId = device.id.toString();
//         }
//     });
//     connectionSubscription = flutterMindWaveMobile2
//         .connect(
//           deviceId,
//         ) // licenseKey is optional for iOS EEG Algorithm
//         .listen((MWMConnectionState connectionState) {});
//   }

//   @override
//   void dispose() {
//     connectionSubscription.cancel();
//     flutterMindWaveMobile2.disconnect();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           StreamBuilder(
//             stream: flutterMindWaveMobile2.connect(
//               deviceId,
//             ),
//             builder: (BuildContext context,
//                 AsyncSnapshot<MWMConnectionState> snapshot) {
//               if (snapshot.hasData) {
//                 switch (snapshot.data) {
//                   case MWMConnectionState.connected:
//                     {
//                       return Text("Connected");
//                     }

//                     break;
//                   case MWMConnectionState.connecting:
//                     {
//                       return Text("connecting");
//                     }

//                     break;
//                   case MWMConnectionState.disconnected:
//                     {
//                       return Text("disconnected");
//                     }

//                     break;
//                   case MWMConnectionState.scanning:
//                     {
//                       return Text("scanning");
//                     }

//                     break;
//                   default:
//                     {
//                       return Text("default error");
//                     }
//                 }
//               } else {
//                 return CircularProgressIndicator();
//               }
//             },
//           ),
//           StreamBuilder(
//             stream: flutterMindWaveMobile2.onAttention(),
//             builder: (BuildContext context, AsyncSnapshot snapshot) {
//               return Container(
//                 child: Text("attention value ${snapshot.data}"),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
