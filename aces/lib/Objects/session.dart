class Session {
  DateTime startTime;
  DateTime endTime;
  Duration duration;
  String place;
  double rating;
  String task;
  int tiredness;
  Duration timeInFlow;
  String sessionNotes;

  Session(
      {this.duration,
      this.endTime,
      this.startTime,
      this.place,
      this.rating,
      this.sessionNotes,
      this.timeInFlow,
      this.tiredness,
      this.task});

  Map<String, dynamic> toJson() => {
        'task': task,
        'startTime': startTime,
        'endTime': endTime,
        'duration': duration.toString(),
        'place': place,
        'rating': rating,
        'tiredness': tiredness,
        'timeInFlow': timeInFlow.toString(),
        'sessionNotes': sessionNotes,
      };

  Session.fromJson(Map<String, dynamic> json) {
    task = json['task'] ?? "";
    startTime = json['startTime'];
    endTime = json['endTime'];
    duration = startTime.difference(endTime);
    place = json['place'];
    rating = json['rating'];
    tiredness = json['tiredness'];
    timeInFlow = json['timeInFlow'];
    sessionNotes = json['sessionNotes'];
  }
}

Session getDummySession() {
  return Session(
    duration: Duration(minutes: 100),
    endTime: DateTime.now().add(Duration(hours: 5)),
    place: "House",
    rating: 4.7,
    sessionNotes: "It was pretty average.",
    startTime: DateTime.now(),
    timeInFlow: Duration(minutes: 50),
    tiredness: 8,
  );
}
