// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);
import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        required this.username,
        required this.state,
        required this.roles,
        required this.phone,
        required this.token,
        required this.email,
    });

    String username;
    int state;
    int roles;
    String phone;
    String token;
    String email;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        username: json["username"],
        state: json["state"],
        roles: json["roles"],
        phone: json["phone"],
        token: json["token"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "state": state,
        "roles": roles,
        "phone": phone,
        "token": token,
        "email": email,
    };
}
