class AppUser{
  String? id;
  String? firstName;
  String? lastName;
  String? token;
  String? email;

  AppUser.fromData({this.id,
  this.email,this.firstName,this.lastName,
  this.token});
}