import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInMethods {
  static late GoogleSignIn googleSignInMethods;
  static Future<GoogleSignInAccount?> googleSignInUser(){
    googleSignInMethods = GoogleSignIn();
    return googleSignInMethods.signIn();
  }
  static signOut() async {
    await googleSignInMethods.signOut();
  }
}