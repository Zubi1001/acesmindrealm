class Session {
  DateTime startTime;
  DateTime endTime;
  Duration duration;
  String place;
  double rating;
  int tiredness;
  Duration timeInFlow;
  String sessionNotes;

  Session({
    this.duration,
    this.endTime,
    this.startTime,
    this.place,
    this.rating,
    this.sessionNotes,
    this.timeInFlow,
    this.tiredness,
  });

  Map<String, dynamic> toJson() => {
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
