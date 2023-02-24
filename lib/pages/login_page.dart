import 'package:chat_room/auth/auth_service.dart';
import 'package:chat_room/models/user_model.dart';
import 'package:chat_room/pages/user_profile_page.dart';
import 'package:chat_room/providers/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/loginpage';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool isLogin = true;
  final formkey = GlobalKey<FormState>();
  String errMsg = '';
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                // Text('Welcome back!'),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'this field must not be empty';
                    }
                    return null;
                  },
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      filled: true),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'this field must not be empty';
                    }
                    return null;
                  },
                  controller: passController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isObscure ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () => setState(() {
                          isObscure = !isObscure;
                        }),
                      ),
                      filled: true),
                ),
                TextButton(
                    onPressed: () {
                      isLogin = true;
                      authenticate();
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white),
                    )),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('New user'),
                    TextButton(
                        onPressed: () {
                          isLogin = false;
                          authenticate();
                        },
                        child: Text('Register Here')),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Forget Password'),
                    TextButton(onPressed: () {}, child: Text('Click Here')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  authenticate() async {
    if (formkey.currentState!.validate()) {
      bool status;
      try{
         if(isLogin){
           status = await AuthService.login(emailController.text, passController.text);
         }else{
           status = await AuthService.register(emailController.text, passController.text);
           await AuthService.sendVerification();
           final userModel= UserModel(
             uid: AuthService.user!.uid,
             email: AuthService.user!.email
           );
           if(mounted){
             await Provider.of<UserProvider>(context,listen: false).addUser(userModel);
           }
         }
         if(status){
           if(!mounted) return;
           Navigator.pushReplacementNamed(context, UserProfilePage.routeName);
         }
      } on FirebaseAuthException catch (e){
        setState(() {
          errMsg = e.message!;
        });
      }
    }
  }
}
