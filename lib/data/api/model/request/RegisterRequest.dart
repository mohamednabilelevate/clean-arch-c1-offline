/// userName : "Nour Saeed"
/// firstName : "Nour"
/// lastName : "Saeed"
/// email : "admin@elevate.com"
/// password : "Test123"
/// rePassword : "Test123"
/// phone : "01094155711"

class RegisterRequest {
  RegisterRequest({
      this.userName, 
      this.firstName, 
      this.lastName, 
      this.email, 
      this.password, 
      this.rePassword, 
      this.phone,});

  RegisterRequest.fromJson(dynamic json) {
    userName = json['userName'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    rePassword = json['rePassword'];
    phone = json['phone'];
  }
  String? userName;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? rePassword;
  String? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userName'] = userName;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['password'] = password;
    map['rePassword'] = rePassword;
    map['phone'] = phone;
    return map;
  }

}