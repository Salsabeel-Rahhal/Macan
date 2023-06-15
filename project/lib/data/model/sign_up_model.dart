class SignUpModel {
  String userName;
  String email;
  String phoneNumber;
  String passowrd;
  SignUpModel(this.userName, this.email, this.phoneNumber, this.passowrd);

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
        json['userName'], json['email'], json['phoneNumber'], json['password']);
  }
}
