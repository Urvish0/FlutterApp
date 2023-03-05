import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_app/models/user_model.dart';

class user_repo extends GetxController{
  static user_repo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async{
    await _db.collection("Users").add(user.toJson())
        .whenComplete(
            () => Get.snackbar("Success", "Your account has been created.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.purple.withOpacity(0.1),
              colorText: Colors.black,),
    ).catchError((error, stackTrace){
      Get.snackbar("Error", "Something went wrong. Try again",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.purple.withOpacity(0.1),
        colorText: Colors.black,);
      print(error.toString());
    });
  }

}
