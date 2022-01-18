import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:social_blog/component_widgets/builder_widgets/error_builder_widget.dart';
import 'package:social_blog/component_widgets/builder_widgets/loading_builder_widget.dart';
import 'package:social_blog/screens/home_screen.dart';

import 'auth/google_auth_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  //FirebaseAuth.instance
  //   .authStateChanges()
  @override
  Widget build(BuildContext context) {
    Size devSize = MediaQuery.of(context).size;
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasError){
            return Scaffold(body: ErrorBuilderWidget(error: snapshot.error,fromFuture: "Firebase Auth",),);
          }
          if(snapshot.connectionState == ConnectionState.active){
            if(snapshot.data == null){
              return _authWelcomeScreenBuilder(devSize);
            } else {
              return HomeScreen();
            }
          }
          return Scaffold(body: LoadingBuilderWidget(),);
        });
  }
  Widget _authWelcomeScreenBuilder(Size devSize) => Scaffold(
    body: Container(
        height: devSize.height,
        width: devSize.width,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Column(children: [
                Text("Welcome to",style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 25.0,
                    color: Colors.blueAccent)),
                Text("SOCIAL BLOG",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 30.0,
                        color: Colors.blueAccent))
              ],),
            ),
            Image.asset("assets/images/social_chatting.jpg"),
            Container(
              child: SignInButton(
                Buttons.Google,
                text: "Sign up with Google",
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> GoogleAuthScreen()));
                  // ScaffoldMessenger.of(context)
                  //     .showSnackBar(SnackBar(content: Text("signing in")));
                },
              ),
            )
          ],
        )),
  );
}
