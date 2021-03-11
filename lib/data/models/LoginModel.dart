class LoginModel {
  String user;
  String pass;

  LoginModel({this.user, this.pass});

  LoginModel.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    pass = json['pass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['pass'] = this.pass;
    return data;
  }
}
