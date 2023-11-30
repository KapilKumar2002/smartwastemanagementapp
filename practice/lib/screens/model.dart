// UserModel Code

class UserModel {
  String? userName;
  String? email;
  String? phonNumber;
  String? id;

  UserModel({this.userName, this.email, this.phonNumber, this.id});

  UserModel.fromJson(Map<String, dynamic> json) {
    // ye jo hai jab data api se fetch karte hai tab use kiya jata hai
    userName = json['userName'];
    email = json['email'];
    phonNumber = json['phonNumber'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String,
        dynamic>(); // data ko json( map)  me convert karne ke liye yahan string isliye hai kyuki username, email, phonNumber keys to fix hai lekin inke andar aane wala data dynamic hoga
    // isliye <String,dynamic> format use kiya gaya hai.

    data['userName'] = this.userName;
    data['email'] = this.email;
    data['phonNumber'] = this.phonNumber;
    data['id'] = this.id;
    return data;
  }
}


// map jo hai vo json hi hoti hai jisme hum key value pairs ko rakhte hai {"name":"Kapil","email":"Xyz@gmail.com"} aise