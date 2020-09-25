class User {
  String name;
  String uid;
  String email;
  int sessionCount = 0;
  int overallAverageFocus = 0;
  int allTimeHighestFocus = 0;
  int allTimeAverage = 0;

  User({
    this.email,
    this.name,
    this.uid,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'uid': uid,
        'email': email,
      };

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    uid = json['uid'];
    email = json['email'];
  }
}
