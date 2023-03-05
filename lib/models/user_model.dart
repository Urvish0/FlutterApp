

import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String? id;
  final String userName;
  final String userAge;
  final String userGender;
  final String userPhone;

  const UserModel({
    this.id,
    required this.userName,
    required this.userAge,
    required this.userGender,
    required this.userPhone,

  });

  toJson(){
    return {
      "UserName ": userName,
      "UserAge ": userAge,
      "UserGender ": userGender,
      "UserPhone ": userPhone,
    };
  }

}