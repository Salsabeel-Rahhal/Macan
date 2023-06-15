import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String? email;
  String? password;
  String? userName;
  String? phoneNumber;

  User({this.email, this.password, this.userName, this.phoneNumber});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        email: json["email"],
        password: json["password"],
        userName: json["userName"],
        phoneNumber: json["phoneNumber"]);
  }
  Map<String, dynamic> toJsonLogin() {
    return {
      "email": email,
      "password": password,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "userName": userName,
      "phoneNumber": phoneNumber
    };
  }

  Map<String, dynamic> tojsonemail() {
    return {
      "email": email,
    };
  }

  factory User.fromQuery(QueryDocumentSnapshot<Object?> json) {
    return User(
      password: json["password"] ?? "",
      email: json["email"] ?? "",
    );
  }
}
