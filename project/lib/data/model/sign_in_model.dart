class SignInModel {
  String type;
  String token;
  SignInModel(this.type, this.token);

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(json['type'], json['token']);
  }
}
