import 'package:chat_room/auth/auth_service.dart';
import 'package:chat_room/pages/chat_room_page.dart';
import 'package:chat_room/pages/login_page.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 200,
            color: Colors.blue,
          ),ListTile(
            onTap: () {
             Navigator.pushReplacementNamed(context, ChatRoomPage.routeName);
            },
            leading: const Icon(Icons.chat),
            title: const Text('ChatRoom'),
          ),
          ListTile(
            onTap: () async{
              await AuthService.logout().then((value) => Navigator.pushReplacementNamed(context, LoginPage.routeName));
            },
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
          )
        ],
      ),
    );
  }
}
