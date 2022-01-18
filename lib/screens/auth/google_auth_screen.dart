import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_blog/component_widgets/builder_widgets/error_builder_widget.dart';
import 'package:social_blog/component_widgets/builder_widgets/loading_builder_widget.dart';
import 'package:social_blog/config/google_sign_in_methods.dart';

import '../auth_screen.dart';
class GoogleAuthScreen extends StatelessWidget {
  const GoogleAuthScreen({Key? key}) : super(key: key);

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignInMethods.googleSignInUser();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserCredential>(
        future: signInWithGoogle(),
        builder: (context,snapshot){
          if(snapshot.hasError){
            return Scaffold(body: ErrorBuilderWidget(error: snapshot.error,fromFuture: "Google Sign In",),);
          }
          if(snapshot.connectionState == ConnectionState.done){
            return AuthScreen();
          }
          return Scaffold(body: LoadingBuilderWidget(),);
    });
  }
}
