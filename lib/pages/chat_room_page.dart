import 'package:chat_room/providers/chat_room_provider.dart';
import 'package:chat_room/widgets/message_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatRoomPage extends StatefulWidget {
  static const String routeName = '/_chatroom';

  const ChatRoomPage({Key? key}) : super(key: key);

  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  final msgController = TextEditingController();
 bool isInit = true;
 @override
  void didChangeDependencies() {
    if(isInit){
      Provider.of<ChatRoomProvider>(context,listen: false).getAllChatRoomMessages();
      isInit = false;
    }
    super.didChangeDependencies();
  }
  @override
  void dispose() {
    msgController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ChatRoomProvider>(
        builder: (context, provider, _) => Column(
          children: [
            Expanded(child: ListView.builder(
              reverse: true,
              itemCount:provider.msgList.length ,
              itemBuilder: (context,index){
                final msg = provider.msgList[index];
                return MessageItem(messageModel: msg);
              },
            )),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 50,
                    width: 120,
                    child: TextField(
                      controller: msgController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Aa',
                      ),
                    ),
                  ),
                )),
                IconButton(
                    onPressed: () {
                      provider.addMsg(msgController.text);
                      msgController.clear();
                    },
                    icon: const Icon(
                      Icons.send,
                      color: Colors.redAccent,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
