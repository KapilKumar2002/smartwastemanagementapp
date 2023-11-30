class UserMOdel {
  String? userName;
  String? email;
  String? phonNumber;
  String? id;

  UserMOdel({this.userName, this.email, this.phonNumber, this.id});

  UserMOdel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    email = json['email'];
    phonNumber = json['phonNumber'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['phonNumber'] = this.phonNumber;
    data['id'] = this.id;
    return data;
  }
}
