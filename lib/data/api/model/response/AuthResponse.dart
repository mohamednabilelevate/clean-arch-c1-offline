import 'User.dart';

/// message : "success"
/// user : {"name":"Mohamed Nabil","email":"nabil@route.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzY2MyN2QzNTJkZWQxYWM1MmE0ZGI2NyIsIm5hbWUiOiJNb2hhbWVkIE5hYmlsIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3MjgwMzQwMzgsImV4cCI6MTczNTgxMDAzOH0.1gDqXruuRr6LKwL-Qlrl6Vpv4p6tydo4XWldF7Dzu8A"

class AuthResponse {
  AuthResponse({
      this.message, 
      this.user, 
      this.token,});

  AuthResponse.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  User? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

}