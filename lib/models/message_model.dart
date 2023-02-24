import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  int? msgId;
  String? userUid;
  String? userName;
  String? userImage;
  String msg;
  String email;
  Timestamp timestamp;
  String? image;

  MessageModel({
    this.userName,
    this.userImage,
    this.msgId,
    this.userUid,
    required this.msg,
    required this.email,
    required this.timestamp,
    this.image
  });
  Map<String,dynamic> tomap(){

    return <String,dynamic>{
      'msgId': msgId,
      'userUid':userUid,
      'msg':msg,
      'timestamp':timestamp,
      'image':image,
      'userName':userName,
      'userImage':userImage,
      'email':email,
    };
  }
  factory MessageModel.fromMap(Map<String,dynamic> map) => MessageModel(
    msg: map['msg'],
    msgId: map['msgId'],
    userUid: map['userUid'],
    timestamp: map['timestamp'],
    image: map['image'],
    userImage: map['userImage'],
    userName: map['userName'],
    email: map['email'],
  );
}
