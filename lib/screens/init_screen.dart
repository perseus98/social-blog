import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_blog/component_widgets/builder_widgets/error_builder_widget.dart';
import 'package:social_blog/component_widgets/builder_widgets/loading_builder_widget.dart';
import 'package:social_blog/firebase_options.dart';
import 'package:social_blog/screens/home_screen.dart';

import 'auth_screen.dart';
class InitScreen extends StatefulWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
        builder: (context,snapshot){
          if(snapshot.hasError){
            return Scaffold(body: ErrorBuilderWidget(error: snapshot.error,fromFuture: "Firebase Init",),);
          }
          if(snapshot.connectionState == ConnectionState.done){
            return AuthScreen();
          }
          return Scaffold(body: LoadingBuilderWidget(),);
    });
  }
}
