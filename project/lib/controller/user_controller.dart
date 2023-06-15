import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../data/model/user_model.dart';
import 'api_helper.dart';

class UserController {
  Future<Object> signIn(String email, String password) async {
    User user = User(
      email: email,
      password: password,
    );
    try {
      dynamic jsonObject =
          await ApiHelper().postRequest("users/signIn", user.toJsonLogin());
      String type = jsonObject["type"];
      String token = jsonObject["token"];
      var storage = const FlutterSecureStorage();
      await storage.write(key: "token", value: "$type $token");

      return true;
    } catch (ex) {
      rethrow;
    }
  }

  Future<bool> create(User user) async {
    try {
      dynamic jsonObject =
          await ApiHelper().postRequest("users/signUp", user.toJson());
      String type = jsonObject["type"];
      String token = jsonObject["token"];
      var storage = const FlutterSecureStorage();
      await storage.write(key: "token", value: "$type $token");
      print(user);
      return true;
    } catch (ex) {
      rethrow;
    }
  }

  Future<User> update(
      {required String email,
      required String password,
      required String username}) async {
    try {
      var result = await ApiHelper().putRequest("users", {
        "email": email,
        "password": password,
        "username": username,
      });
      return User.fromJson(result);
    } catch (e) {
      rethrow;
    }
  }

  Future<User> getUser() async {
    try {
      var result = await ApiHelper().getRequest("users");
      return User.fromJson(result);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> getemail(User user) async {
    try {
      dynamic jsonObject =
          await ApiHelper().postRequest("api/users/email", user.tojsonemail());
      String type = jsonObject["email"];

      var storage = const FlutterSecureStorage();
      await storage.write(key: "token", value: "$type ");

      return true;
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }
}
