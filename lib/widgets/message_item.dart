import 'package:chat_room/models/message_model.dart';
import 'package:chat_room/utils/helper_function.dart';
import 'package:flutter/material.dart';

import '../auth/auth_service.dart';

class MessageItem extends StatelessWidget {
  final MessageModel messageModel;

  const MessageItem({Key? key, required this.messageModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: messageModel.userUid == AuthService.user!.uid
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Text(messageModel.userName ?? messageModel.email),
            Text(getFormattedDate(messageModel.timestamp.toDate())),
            Text(messageModel.msg,style: const TextStyle(fontSize: 16,color: Colors.black),)

          ],
        ),
      ),
    );
  }
}
