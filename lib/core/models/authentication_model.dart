// To parse this JSON data, do
//
//     final authenticationModel = authenticationModelFromJson(jsonString);

import 'dart:convert';

AuthenticationModel authenticationModelFromJson(String str) =>
    AuthenticationModel.fromJson(json.decode(str));

String authenticationModelToJson(AuthenticationModel data) =>
    json.encode(data.toJson());

class AuthenticationModel {
  String accessToken;
  String pid;
  String ucsdaffiliation;
  int expiration;

  AuthenticationModel({
    this.accessToken,
    this.pid,
    this.ucsdaffiliation,
    this.expiration,
  });

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) =>
      AuthenticationModel(
        accessToken: json["access_token"] == null ? null : json["access_token"],
        pid: json["pid"] == null ? null : json["pid"],
        ucsdaffiliation:
            json["ucsdaffiliation"] == null ? null : json["ucsdaffiliation"],
        expiration: json["expiration"] == null ? 0 : json["expiration"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken == null ? null : accessToken,
        "pid": pid == null ? null : pid,
        "ucsdaffiliation": ucsdaffiliation == null ? null : ucsdaffiliation,
        "expiration": expiration == null ? null : expiration,
      };

  /// Checks if the token we got back is expired
  bool isLoggedIn(DateTime lastUpdated) {
    if (lastUpdated == null) {
      return false;
    }
    if (expiration == null) {
      return false;
    }
    if (DateTime.now()
        .isAfter(lastUpdated.add(Duration(seconds: expiration)))) {
      return false;
    }
    return true;
  }
}