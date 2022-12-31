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
        required this.id,
    });

    String username;
    int state;
    int roles;
    String phone;
    String token;
    String email;
    String id;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        username: json["username"],
        state: json["state"],
        roles: json["roles"],
        phone: json["phone"],
        token: json["token"],
        email: json["email"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "state": state,
        "roles": roles,
        "phone": phone,
        "token": token,
        "email": email,
        "id": id,
    };
}
