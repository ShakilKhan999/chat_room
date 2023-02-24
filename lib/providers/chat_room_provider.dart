import 'package:chat_room/auth/auth_service.dart';
import 'package:chat_room/db/dbhelper.dart';
import 'package:chat_room/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class ChatRoomProvider extends ChangeNotifier {
  List<MessageModel> msgList = [];

  Future<void> addMsg(String msg) {
    final messageModel = MessageModel(
      msgId: DateTime.now().microsecondsSinceEpoch,
      userUid: AuthService.user!.uid,
      userName: AuthService.user!.displayName,
      userImage: AuthService.user!.photoURL,
      email: AuthService.user!.email!,
      msg: msg,
      timestamp: Timestamp.fromDate(DateTime.now()),
    );
    return DBHelper.addMsg(messageModel);
  }

  getAllChatRoomMessages() {
    DBHelper.getAllChatRoomMessages().listen((snapshot) {
      msgList = List.generate(snapshot.docs.length,
          (index) => MessageModel.fromMap(snapshot.docs[index].data()));
      notifyListeners();
    });
  }
}
