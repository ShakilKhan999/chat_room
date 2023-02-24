import 'package:chat_room/pages/chat_room_page.dart';
import 'package:chat_room/pages/launcher_page.dart';
import 'package:chat_room/pages/login_page.dart';
import 'package:chat_room/pages/user_profile_page.dart';
import 'package:chat_room/providers/chat_room_provider.dart';
import 'package:chat_room/providers/user_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> UserProvider()),
        ChangeNotifierProvider(create: (_)=> ChatRoomProvider()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LauncherPage.routeName,
      routes: {
        LauncherPage.routeName:(context)=>LauncherPage(),
        LoginPage.routeName:(context)=> LoginPage(),
        UserProfilePage.routeName:(context)=>UserProfilePage(),
        ChatRoomPage.routeName:(context)=> ChatRoomPage(),
      },
    );
  }
}


