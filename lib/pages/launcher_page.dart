import 'package:chat_room/auth/auth_service.dart';
import 'package:chat_room/pages/user_profile_page.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class LauncherPage extends StatefulWidget {
  static const String routeName ='/launcher';
  const LauncherPage({Key? key}) : super(key: key);

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  void initState() {
    Future.delayed(Duration.zero,(){
     if(AuthService.user == null){
       Navigator.pushReplacementNamed(context, LoginPage.routeName);
     }else{
       Navigator.pushReplacementNamed(context, UserProfilePage.routeName);
     }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
