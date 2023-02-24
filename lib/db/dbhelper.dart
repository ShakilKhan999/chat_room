import 'package:chat_room/models/message_model.dart';
import 'package:chat_room/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DBHelper {
  static const String collectionUser = 'User';
  static const String collectionRoomMessage = 'chatRoomMessages';

  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> addUser(UserModel userModel) {
    return _db
        .collection(collectionUser)
        .doc(userModel.uid)
        .set(userModel.toMap());
  }

  static Future<void> addMsg(MessageModel messageModel) {
    final doc = _db.collection(collectionRoomMessage).doc();
    return doc.set(messageModel.tomap());
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllChatRoomMessages() =>
      _db
          .collection(collectionRoomMessage)
          .orderBy('msgId', descending: true)
          .snapshots();

  static Stream<DocumentSnapshot<Map<String, dynamic>>> getUserById(
          String uid) =>
      _db.collection(collectionUser).doc(uid).snapshots();

  static Future<void> updateProfile(String uid, Map<String, dynamic> map) {
    return _db.collection(collectionUser).doc(uid).update(map);
  }
}
