import 'dart:convert';

AuthorizationModel AuthorizationModelFromJson(String str) => AuthorizationModel.fromJson(json.decode(str));

String AuthorizationModelToJson(AuthorizationModel data) => json.encode(data.toJson());

class AuthorizationModel {
  String accessToken;
  String tokenType;
  int expiresIn;
  String refreshToken;
  String scope;

  AuthorizationModel({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.refreshToken,
    this.scope,
  });

  factory AuthorizationModel.fromJson(Map<String, dynamic> json) => AuthorizationModel(
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    expiresIn: json["expires_in"],
    refreshToken: json["refresh_token"],
    scope: json["scope"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "token_type": tokenType,
    "expires_in": expiresIn,
    "refresh_token": refreshToken,
    "scope": scope,
  };
}