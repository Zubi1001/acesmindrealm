class Session {
  // DateTime startTime;
  // DateTime endTime;
  String sessionID;
  int durationInSeconds;
  String place;
  double rating;
  String task;
  int tiredness;
  int timeInFlowInSeconds;
  String sessionNotes;
  int averageSessionFocus;
  int highestFocus;
  int lowestFocus;
  int timeInFocusInSeconds;
  DateTime sessionDate;

  Session({
    //this.duration,
    this.sessionDate,
    // this.endTime,
    // this.startTime,
    this.place,
    this.rating,
    this.sessionNotes,
    this.sessionID,
    // this.timeInFlow,
    this.tiredness,
    this.task,
    this.averageSessionFocus,
    this.durationInSeconds,
    this.highestFocus,
    this.lowestFocus,
    this.timeInFlowInSeconds,
    this.timeInFocusInSeconds,
  });

  Map<String, dynamic> toJson() => {
        'sessionID': sessionID,
        'task': task,
        'sessionDate': DateTime.now().toIso8601String(),
        'duration': durationInSeconds,
        'highestFocus': highestFocus,
        'lowestFocus': lowestFocus,
        'timeInFlowInSeconds': timeInFlowInSeconds,
        'timeInFocusInSeconds': timeInFocusInSeconds,
        'place': place,
        'rating': rating,
        'tiredness': tiredness,
        //'timeInFlow': timeInFlow.toString(),
        'sessionNotes': sessionNotes,
      };

  Session.fromJson(Map<String, dynamic> json) {
    sessionID=json['sessionID'];
    task = json['task'] ?? "";
    durationInSeconds = json['durationInSeconds'];
    lowestFocus = json['lowestFocus'];
    highestFocus = json['highestFocus'];
    place = json['place'];
    rating = json['rating'];
    tiredness = json['tiredness'];
    timeInFlowInSeconds = json['timeInFlowInSeconds'];
    sessionNotes = json['sessionNotes'];
    sessionDate = DateTime.tryParse(json['sessionDate'].toString());
    timeInFocusInSeconds = json['timeInFocusInSeconds'];
  }
}

// Session getDummySession() {
//   return Session(
//     duration: Duration(minutes: 100),
//     endTime: DateTime.now().add(Duration(hours: 5)),
//     place: "House",
//     rating: 4.7,
//     sessionNotes: "It was pretty average.",
//     startTime: DateTime.now(),
//     timeInFlow: Duration(minutes: 50),
//     tiredness: 8,
//   );
// }
