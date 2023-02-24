import 'package:flutter/material.dart';

class UserModel{
  String? uid;
  String? name;
  String? email;
  String? mobile;
  String? image;
  bool available;
  String? deviceToken;

  UserModel(
      {this.uid,
      this.name,
      this.email,
      this.mobile,
      this.image,
      this.available = true,this.deviceToken,
     });
  Map<String, dynamic> toMap(){
    return <String,dynamic>{
      'uid': uid,
      'name':name,
      'email':email,
      'mobile':mobile,
      'image': image,
      'available':available,
      'deviceToken':deviceToken
    };

  }
  factory UserModel.fromMap(Map<String,dynamic>map)=>UserModel(
    uid: map['uid'],
    name: map['name'],
    mobile: map['mobile'],
    email: map['email'],
    image: map['image'],
    available: map['available'],
    deviceToken: map['deviceToken'],
  );
}